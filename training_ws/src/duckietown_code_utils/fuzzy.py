import random
import re
from abc import ABCMeta, abstractmethod
from collections import OrderedDict

from .contracts_ import contract
from .exception_utils import check_isinstance, describe_type, raise_wrapped
from .exceptions import DTNoMatches, DTUserError
from .instantiate_utils import indent
from .logging_logger import logger
from .text_utils import remove_prefix
from .wildcards import wildcard_to_regexp
from .yaml_pretty import yaml_load


class InvalidQueryForUniverse(Exception):
    pass


class Spec(metaclass=ABCMeta):
    def __init__(self, children):
        self.children = children

    def __str__(self):
        mine = type(self).__name__

        c = [indent(str(_), "", " - ") for _ in self.children]
        return indent("\n".join(c), "", mine + "")

    @abstractmethod
    def match(self, k):
        pass

    def match_dict(self, stuff):
        res = OrderedDict()
        for k, v in list(stuff.items()):
            if self.match(k):
                res[k] = v
        return res


class FromFilename(Spec):

    # TODO: move away in logs_db
    def __init__(self, filename):
        self.filename = filename

    def __str__(self):
        return "File:%s" % self.filename

    def match(self, _):
        return False

    def match_dict(self, _):
        from easy_logs.logs_db import physical_log_from_filename, get_all_resources

        all_resources = get_all_resources()

        l = physical_log_from_filename(self.filename, all_resources.basename2filename)
        od = OrderedDict()
        od[l.log_name] = l
        return od


class Or(Spec):
    def match(self, x):
        for option in self.children:
            if option.match(x):
                return True
        return False

    def match_dict(self, seq):
        matches = OrderedDict()
        for option in self.children:
            theirs = option.match_dict(seq)
            for k, v in list(theirs.items()):
                if not k in matches:
                    matches[k] = v
        return matches


class And(Spec):
    def match(self, x):
        for option in self.children:
            if not option.match(x):
                return False
        return True

    def match_dict(self, seq):
        matches = OrderedDict()
        children_answers = []
        for option in self.children:
            theirs = option.match_dict(seq)
            children_answers.append(theirs)

        for k, v in list(seq.items()):
            ok = all(k in _ for _ in children_answers)
            if ok:
                matches[k] = v
        return matches


class OnlyFirst(Spec):
    def __init__(self, spec):
        Spec.__init__(self, [spec])

    def match(self, x):
        return self.children[0].match(x)  # XXX

    def match_dict(self, seq):
        results = self.children[0].match_dict(seq)

        res = OrderedDict()
        if results:
            k = list(results)[0]
            res[k] = results[k]
        return res


class Slice(Spec):
    def __init__(self, spec, indices):
        Spec.__init__(self, [spec])
        self.indices = indices

    def match(self, x):
        return self.children[0].match(x)  # XXX

    def __str__(self):
        s = "Slice   [%s,%s,%s]" % self.indices
        s += "\n" + indent(str(self.children[0]), "  ")
        return s

    def match_dict(self, seq):
        results = self.children[0].match_dict(seq)
        res = OrderedDict()
        keys = list(results)
        a, b, c = self.indices
        keys2 = keys[a:b:c]
        #         print('leys: %s keys2 : %s' % (keys, keys2))
        for k in keys2:
            res[k] = results[k]
        return res


class Shuffle(Spec):
    """Sort entries by name"""

    def __init__(self, spec):
        Spec.__init__(self, [spec])

    def match(self, x):
        raise NotImplementedError()

    def __str__(self):
        s = "Shuffle"
        s += "\n" + indent(str(self.children[0]), "  ")
        return s

    def match_dict(self, seq):
        results = self.children[0].match_dict(seq)
        res = OrderedDict()
        keys = list(results)
        random.shuffle(keys)
        for k in keys:
            res[k] = results[k]
        return res


class Sort(Spec):
    @contract(key=str)
    def __init__(self, spec, key):
        Spec.__init__(self, [spec])
        self.key = key

    def match(self, x):
        raise NotImplementedError()

    def __str__(self):
        s = "Sort by %s" % self.key
        s += "\n" + indent(str(self.children[0]), "  ")
        return s

    def match_dict(self, seq):
        results = self.children[0].match_dict(seq)
        res = OrderedDict()
        key = lambda _: _get_tag(seq[_], self.key)
        keys = sorted(results, key=key)
        #        print('sorted: %s' % keys)
        #        print('keys: %s' % map(key, keys))
        for k in keys:
            res[k] = results[k]
        return res


class Reverse(Spec):
    def __init__(self, spec):
        Spec.__init__(self, [spec])

    def match(self, x):
        raise NotImplementedError()

    def __str__(self):
        s = "Reverse"
        s += "\n" + indent(str(self.children[0]), "  ")
        return s

    def match_dict(self, seq):
        results = self.children[0].match_dict(seq)
        res = OrderedDict()
        for k in reversed(list(results)):
            res[k] = results[k]
        return res


def _get_tag(x, tagname):
    if isinstance(x, dict):
        if not tagname in x:
            msg = "Cannot find %r in keys %r" % (tagname, list(x.keys()))
            raise InvalidQueryForUniverse(msg)
        return x[tagname]
    else:
        if not hasattr(x, tagname):
            msg = 'The object of type %s does not have attribute "%s".' % (
                type(x).__name__,
                tagname,
            )
            try:
                msg += "\nThe available attributes are:\n  %s" % sorted(x.__dict__.keys())
            except:
                pass
            raise InvalidQueryForUniverse(msg)
        return getattr(x, tagname)


class Index(Spec):
    def __init__(self, spec, index):
        Spec.__init__(self, [spec])
        self.index = index

    def match(self, x):
        return self.children[0].match(x)  # XXX

    def __str__(self):
        s = "index  %s" % self.index
        s += "\n" + indent(str(self.children[0]), "  ")
        return s

    def match_dict(self, seq):
        results = self.children[0].match_dict(seq)
        res = OrderedDict()
        keys = list(results)
        k = keys[self.index]
        res[k] = results[k]
        return res


class ByTag(Spec):
    def __init__(self, tagname, spec):
        if "*" in tagname:
            msg = "Invalid tag %s." % tagname.__repr__()
            raise ValueError(msg)
        Spec.__init__(self, [])
        self.tagname = tagname
        self.spec = spec

    def __str__(self):
        return indent(self.spec.__str__, "", "attribute %s satisfies \n  " % self.tagname)

    def match(self, x):
        if isinstance(x, dict):
            if not self.tagname in x:
                msg = "Cannot find %r in keys %r" % (self.tagname, list(x.keys()))
                raise InvalidQueryForUniverse(msg)
            val = x[self.tagname]
        else:
            if not hasattr(x, self.tagname):
                msg = 'The object of type %s does not have attribute "%s".' % (
                    type(x).__name__,
                    self.tagname,
                )
                try:
                    msg += "\nThe available attributes are:\n  %s" % sorted(x.__dict__.keys())
                except:
                    pass
                raise InvalidQueryForUniverse(msg)
            val = getattr(x, self.tagname)
        res = self.spec.match(val)
        return res

    def match_dict(self, seq):
        matches = OrderedDict()
        for k, v in list(seq.items()):
            if self.match(v):
                matches[k] = v
        return matches


class Constant(Spec):
    def __init__(self, s):
        self.s = yaml_load(s)

    def __str__(self):
        return "is equal to %r" % self.s

    def match(self, x):
        return self.s == x


class MatchAll(Spec):
    def __init__(self):
        pass

    def __str__(self):
        return "(always matches)"

    def match(self, _):
        return True


class Wildcard(Spec):
    def __init__(self, pattern):
        self.pattern = pattern
        self.regexp = wildcard_to_regexp(pattern)

    def __str__(self):
        return "matches %s" % self.pattern

    def match(self, x):
        return isinstance(x, str) and self.regexp.match(x)


def value_as_float(x):
    try:
        return float(x)
    except Exception as e:
        logger.error("Cannot convert to float %r: %s" % (x, e))
        raise


class LT(Spec):
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return "less than %s" % self.value

    def match(self, x):
        if x is None:
            return False
        v = value_as_float(x)
        return v < self.value


class Contains(Spec):
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return "contains %s" % self.value

    def match(self, x):
        return self.value in x


class GT(Spec):
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return "greater than %s" % self.value

    def match(self, x):
        if x is None:
            return False
        v = value_as_float(x)
        return v > self.value


def filter_index_simple(m, spec):
    a = int(m.group("a"))
    return Index(spec, a)


def filter_index(m, spec):
    a = m.group("a")
    b = m.group("b")
    c = m.group("c")
    if a is not None:
        a = int(a)
    if b is not None:
        b = int(b)
    if c is not None:
        c = int(c)
    return Slice(spec, (a, b, c))


def filter_sort(m, spec):
    key = m.group("key")
    return Sort(spec, key)


def filter_first(_, spec):
    return OnlyFirst(spec)


def filter_reverse(_, spec):
    return Reverse(spec)


def filter_shuffle(_, spec):
    return Shuffle(spec)


slice_regexp = r"\[(?P<a>-?\d+)?:(?P<b>-?\d+)?(:(?P<c>-?\d+)?)?\]"

filters0 = OrderedDict(
    [
        ("\[(?P<a>\d+)\]", filter_index_simple),
        (slice_regexp, filter_index),
        ("first", filter_first),
        ("shuffle", filter_shuffle),
        ("reverse", filter_reverse),
        ("sort\((?P<key>\w+)\)", filter_sort),
    ]
)


@contract(s=str, returns=Spec)
def parse_match_spec(s, filters=None):
    """

    a, b:>10 or +
    """
    rec = lambda _: parse_match_spec(_, filters=filters)
    if filters is None:
        filters = filters0

    if s == "all" or s == "*" or s == "":
        return MatchAll()

    if s.endswith(".bag"):
        return FromFilename(s)

    if not s:
        msg = "Cannot parse empty string."
        raise ValueError(msg)

    for k, F in list(filters.items()):
        rs = "(.*)/" + k + "$"
        reg = re.compile(rs)

        m = reg.search(s)
        #         print('Trying regexp %s -> %s  aginst %s -> %s' % (k, rs, s, m))
        if m is not None:
            #             logger.debug('Matched group(1) = %r  group(2) = %r'%(m.group(1), m.group(2)))
            rest = m.group(1)
            rest_p = rec(rest)
            try:
                return F(m, rest_p)
            except TypeError as e:
                msg = "Problem with %r, calling %s" % (s, F.__name__)
                raise_wrapped(TypeError, e, msg)
    if "/" in s:
        msg = "I do not know the tag in the string %r." % s
        raise InvalidQueryForUniverse(msg)

    if "+" in s:
        tokens = s.split("+")
        return Or(list(map(rec, tokens)))
    if "," in s:
        tokens = s.split(",")
        return And(list(map(rec, tokens)))

    if s.startswith("contains:"):
        rest = remove_prefix(s, "contains:")
        return Contains(rest)

    if ":" in s:
        i = s.index(":")
        tagname = s[:i]
        tagvalue = s[i + 1 :]
        return ByTag(tagname, rec(tagvalue))

    if s.startswith("<"):
        value = float(s[1:])
        return LT(value)

    if s.startswith(">"):
        value = float(s[1:])
        return GT(value)

    if "*" in s:
        return Wildcard(s)

    return Constant(s)


@contract(stuff=dict)
def fuzzy_match(query, stuff, filters=None, raise_if_no_matches=False):
    """
    spec: a string
    logs: an OrderedDict str -> object
    """
    if not isinstance(stuff, dict):
        msg = "Expectd an OrderedDict, got %s." % describe_type(stuff)
        raise ValueError(msg)
    check_isinstance(stuff, dict)
    check_isinstance(query, str)
    spec = parse_match_spec(query, filters=filters)

    try:
        result = spec.match_dict(stuff)
    except InvalidQueryForUniverse as e:
        msg = "The query does not apply to this type of objects."
        raise_wrapped(DTUserError, e, msg, compact=True)
        raise

    if not result:
        if raise_if_no_matches:
            msg = "Could not find any match in a universe of %d elements." % len(stuff)
            msg += "\nThe query was interpreted as follows:"
            msg += "\n\n" + indent(spec, "", "        %s        means       " % query)
            raise DTNoMatches(msg)
    return result

from collections import OrderedDict, namedtuple
import re

from contracts.utils import check_isinstance

import duckietown_utils as dtu


def expect(data, query, result_keys, filters=None):
    result_keys = list(result_keys)
    check_isinstance(data, OrderedDict)

    if True:
        spec = dtu.parse_match_spec(query, filters=filters)
        # print '-----'
        # print 'Query: %s' % query
        # print dtu.indent(spec, '', 'Spec: ')

    res = dtu.fuzzy_match(query, data, filters=filters)
    check_isinstance(res, OrderedDict)

    if list(res) != result_keys:
        msg = 'Error:'
        msg += '\n Data: %s' % data
        msg += '\n Query: %s' % query
        msg += '\n Result: %s' % list(res)
        msg += '\n Expect: %s' % list(result_keys)
        raise Exception(msg)


@dtu.unit_test
def matches():
    Species = namedtuple('Species', 'name size')
    data = OrderedDict([
        ('one', Species('horse', 'large')),
        ('two', Species('dog', 'medium')),
        ('three', Species('cat', 'medium'))
    ])

    expect(data, 'all', ['one', 'two', 'three'])
    expect(data, '*', ['one', 'two', 'three'])
    expect(data, 'one', ['one'])
    expect(data, 'two+one', ['two', 'one'])
    expect(data, '*o', ['two'])
    expect(data, 'o*', ['one'])

    expect(data, 'all/first', ['one'])
    expect(data, '/first', ['one'])


@dtu.unit_test
def matches_tags():
    Species = namedtuple('Species', 'name size weight')
    data = OrderedDict([
        ('jeb', Species('A big horse', 'large', 200)),
        ('fuffy', Species('A medium dog', 'medium', 50)),
        ('ronny', Species('A medium cat', 'medium', 30)),
    ])

    expect(data, '*', ['jeb', 'fuffy', 'ronny'])

    expect(data, 'name:A big horse', ['jeb'])
    expect(data, 'name:*medium*', ['fuffy', 'ronny'])
    expect(data, 'name:*medium*,weight:>40', ['fuffy'])

    expect(data, 'name:*medium*,weight:<40', ['ronny'])
    expect(data, 'fuffy+ronny', ['fuffy', 'ronny'])
    expect(data, 'name:*dog', ['fuffy'])
    expect(data, 'name:*cat', ['ronny'])
    expect(data, 'name:*dog+name:*cat', ['fuffy', 'ronny'])


@dtu.unit_test
def specs1():
    dtu.parse_match_spec('ciao')
    dtu.parse_match_spec('ciao+no')


@dtu.unit_test
def my_filter():

    rc = re.compile(dtu.slice_regexp)
    m = rc.search('[1:2:3]')
    assert m.group('a') == '1'
    assert m.group('b') == '2'
    assert m.group('c') == '3'

    Species = namedtuple('Species', 'name size weight')
    data = OrderedDict([
        ('jeb', Species('A big horse', 'large', 200)),
        ('fuffy', Species('A medium dog', 'medium', 50)),
        ('ronny', Species('A medium cat', 'medium', 30)),
    ])
    expect(data, 'all', ['jeb', 'fuffy', 'ronny'])

    expect(data, 'all/[0]', ['jeb'])
    expect(data, 'all/[0:]', ['jeb', 'fuffy', 'ronny'])
    expect(data, 'all/[0:1]', ['jeb'])
    expect(data, 'all/[:-1]', ['jeb', 'fuffy'])
    expect(data, 'all/[::1]', ['jeb', 'fuffy', 'ronny'])
    expect(data, 'all/[::2]', ['jeb', 'ronny'])
    expect(data, 'all/[0:3]', ['jeb', 'fuffy', 'ronny'])

    res = dtu.fuzzy_match('all/shuffle', data)
    assert len(res) == 3


@dtu.unit_test
def my_filter_sort():
    from dateutil.parser import parse
    Species = namedtuple('Species', 'name size weight birthday')
    data = OrderedDict([
        ('jeb', Species('A big horse', 'large', 200, parse('1 Jan 2011'))),
        ('fuffy', Species('A medium dog', 'medium', 50, parse('3 Jan 2013'))),
        ('ronny', Species('A medium cat', 'medium', 30, parse('5 Jan 2015'))),
    ])
    expect(data, 'all', ['jeb', 'fuffy', 'ronny'])

    expect(data, 'all/sort(weight)', ['ronny', 'fuffy', 'jeb'])
    expect(data, 'all/sort(birthday)', ['jeb', 'fuffy', 'ronny'])
    expect(data, 'all/sort(birthday)/reverse', ['ronny', 'fuffy', 'jeb'])

    try:
        expect(data, 'all/sort(invalidkey)', ['ronny', 'fuffy', 'jeb'])
    except dtu.DTUserError as e:
        assert 'The query does not apply' in str(e)
    else:
        raise Exception()


if __name__ == '__main__':
    dtu.run_tests_for_this_module()


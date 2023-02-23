from typing import List

import duckietown_code_utils as dtu
from .algo_structures import EasyAlgoFamily


def format_db(db, colorize=True, verbose=False):
    families = list(db.family_name2config.values())
    s = format_families(families, colorize, verbose=verbose)
    return s


def format_families(families: List[EasyAlgoFamily], colorize: bool = True, verbose: bool = True):
    if not families:
        s = "No algorithm families found."
        return s
    else:

        table = [
            [
                "Family name",
                "interface",
                "pattern",
                "# found",
                "valid",
                "filename",
                "description",
            ]
        ]
        for family in families:
            assert isinstance(family, EasyAlgoFamily)
            row = [family.family_name, family.interface, family.instances_pattern]
            if not family.instances:
                row.append("\n(none)")
            else:
                n_valid = len([_ for _ in list(family.instances.values()) if _.valid])
                n_invalid = len(family.instances) - n_valid
                ss = f"{len(family.instances)}"
                if n_invalid:
                    ss += dtu.make_red(f" ({n_invalid} invalid)")
                row.append(ss)

            if family.valid:
                ss = "yes"
            else:
                ss = "no: " + family.error_if_invalid
            row.append(ss)
            row.append(dtu.friendly_path(family.filename))

            if (not family.valid) and colorize:
                row = dtu.make_row_red(row)

            row.append(family.description.strip())
            table.append(row)

        if not verbose:
            dtu.remove_table_field(table, "filename")

        s = f"Found {len(families)} algorithm families:\n\n"
        s += dtu.indent(dtu.format_table_plus(table, colspacing=4), "   ")

        return s


def format_instances(family, colorize, verbose=False):
    if not family.instances:
        s = (
            f'No instances files found for family "{family.family_name}" (pattern = '
            f"{family.instances_pattern}).\n\n"
        )
        return s
    else:
        s = f'Found {len(family.instances)} instances of algorithm family "{family.family_name}":\n'
        table = []
        table.append(["Instance name", "constructor", "parameters", "description", "filename"])
        for _ in list(family.instances.values()):
            row = []
            name = _.instance_name
            if (not _.valid) and colorize:
                name = dtu.make_red(name)

            row.append(name)

            row.append(_.constructor)
            row.append(dtu.yaml_dump_pretty(_.parameters))

            row.append(_.description)
            row.append(dtu.friendly_path(_.filename))

            table.append(row)

        if not verbose:
            dtu.remove_table_field(table, "filename")
            dtu.remove_table_field(table, "description")
        s += dtu.indent(dtu.format_table_plus(table, colspacing=4), "| ")

        for _ in list(family.instances.values()):
            if not _.valid:
                msg = _.error_if_invalid
                s += dtu.make_red("\n" + dtu.indent(msg, "", _.instance_name + ": "))

        return s

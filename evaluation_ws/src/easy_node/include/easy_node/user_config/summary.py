import duckietown_code_utils as dtu
from .db import get_config_db
from .get_configuration_files import ConfigInfo

__all__ = ["user_config_summary"]


def user_config_summary() -> str:
    db = get_config_db()

    # def apply_to_lines(f, x):
    #     return "\n".join(f(_) for _ in x.split('\n'))
    #
    # def red(s):
    #     red_ = lambda _: termcolor.colored(_, 'red')
    #     return apply_to_lines(red_, s)

    red = lambda x: x

    table = []

    table.append(
        [
            "package name",
            "node name",
            "config_name",
            "effective",
            "extends",
            "valid",
            "error",
            "description",
            "filename",
        ]
    )
    for c in db.configs:
        assert isinstance(c, ConfigInfo)
        d = dtu.truncate_string_right(c.description.replace("\n", " "), 40)
        date = c.date_effective.strftime("%Y-%m-%d")
        if c.valid is None:
            valid = "?"
            valid_error = ""
        else:
            valid = "yes" if c.valid else red("no")
            valid_error = "" if c.valid else red(c.error_if_invalid)

        table.append(
            [
                c.package_name,
                c.node_name,
                c.config_name,
                date,
                c.extends,
                valid,
                valid_error,
                d,
                dtu.friendly_path(c.filename),
            ]
        )

    dtu.remove_table_field(table, "filename")

    s = dtu.format_table_plus(table, colspacing=4)
    return s

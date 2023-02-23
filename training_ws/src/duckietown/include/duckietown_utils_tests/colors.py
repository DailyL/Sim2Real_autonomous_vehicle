from termcolor import colored

import duckietown_utils as dtu


@dtu.unit_test
def test_color_sizes():
    s1 = 'one'

    s2 = colored(s1, 'magenta')

#     print(s1.__repr__())
#     print(s2.__repr__())

    l1 = dtu.get_length_on_screen(s1)
    l2 = dtu.get_length_on_screen(s2)
#     print l1, l2
    assert l1 == l2


def get_test_table():
    table = []
    for i in range(3):
        row = []
        for j in range(5):
            row.append('*' * i * j)
        table.append(row)
    return table


@dtu.unit_test
def test_table():

    table = get_test_table()
    r1 = dtu.format_table_plus(table)

    table[1] = dtu.make_row_red(table[1])
    r2 = dtu.format_table_plus(table)

    #print r1
    #print r2
    r2e = dtu.remove_escapes(r2)
    #print r2e
    assert r1 == r2e


if __name__ == '__main__':
    dtu.run_tests_for_this_module()


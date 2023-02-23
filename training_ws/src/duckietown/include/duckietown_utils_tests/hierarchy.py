import duckietown_utils as dtu


@dtu.unit_test
def testh1():
    data = """
    dir1:
       dir2:
           filename: |
                description: desc
                interface: line_detector2.LineDetectorInterface
                tests: {}

    """

    d = dtu.dir_from_data(data)

    #print locate_files(d, '*')

    from os.path import exists, join
    assert exists(join(d, 'dir1'))
    assert exists(join(d, 'dir1', 'dir2'))
    assert exists(join(d, 'dir1', 'dir2', 'filename'))
    f = join(d, 'dir1', 'dir2', 'filename')
    data = open(f).read()
    assert 'description' in data


if __name__ == '__main__':
    dtu.run_tests_for_this_module()


import json
import os

import duckietown_code_utils as dtu


base = ["ipfs", "--api", "/ip4/127.0.0.1/tcp/5001"]


class MakeIPFS:
    def __init__(self):
        self.links = []
        self.total_file_size = 0

    def add_file(self, filename, ipfs, size):
        x = {"Name": filename, "Hash": ipfs, "Size": size}
        self.links.append(x)
        self.total_file_size += size

    def add_file_content(self, filename, s):
        hashed = get_hash_for_bytes(s)
        self.add_file(filename, hashed, len(s))

    def get_dag(self):
        result = {"Data": "\u0008\u0001", "Links": self.links}
        return result

    def total_size(self):
        return self.total_file_size

    def get_ipfs_hash(self):
        dag = self.get_dag()
        dag_json = json.dumps(dag)

        cmd = base + ["object", "put"]
        cwd = "."
        res = dtu.system_cmd_result(cwd, cmd, raise_on_error=True, write_stdin=dag_json)
        hashed = res.stdout.split()[1]
        assert "Qm" in hashed, hashed
        print((f"Directory of {len(self.links)} links: {hashed}"))
        return hashed


def get_hash_for_bytes(s):
    cmd = base + ["add"]
    cwd = "."
    res = dtu.system_cmd_result(cwd, cmd, raise_on_error=True, write_stdin=s)
    hashed = res.stdout.split()[1]
    if not "Qm" in hashed:
        msg = f"Invalid response, no Qm:\n{dtu.indent(res.stdout, '  ')}"
        raise Exception(msg)
    return hashed


def detect_ipfs():
    cmd = base + ["--version"]
    cwd = "."
    try:
        _res = dtu.system_cmd_result(
            cwd, cmd, display_stdout=False, display_stderr=False, raise_on_error=True
        )
    except:
        return False
    return True


def get_ipfs_hash_cached(filename):
    def f():
        return get_ipfs_hash(filename)

    basename = os.path.basename(filename)
    cache_name = "get_ipfs_hash/" + basename
    return dtu.get_cached(cache_name, f, quiet=True)


def get_ipfs_hash(filename):
    # ipfs add --only-hash LICENSE
    # added QmcgpsyWgH8Y8ajJz1Cu72KnS5uo2Aa2LpzU7kinSupNKC LICENSE
    dtu.logger.debug(f"Computing IPFS hash for {filename}")
    cmd = base + ["add", "--only-hash", filename]
    cwd = "."
    res = dtu.system_cmd_result(cwd, cmd, display_stdout=False, display_stderr=False, raise_on_error=True)

    out = res.stdout.strip().split(" ")
    #    print out
    if len(out) < 3 or out[0] != "added" or not out[1].startswith("Qm"):
        msg = f"Invalid output for ipds:\n{dtu.indent(res.stdout, ' > ')}"
        raise Exception(msg)
    hashed = out[1]
    return hashed

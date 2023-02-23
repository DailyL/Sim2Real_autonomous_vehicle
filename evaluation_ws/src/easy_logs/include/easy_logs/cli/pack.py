from easy_logs.app_with_logs import D8AppWithLogs
from easy_logs.cli.gallery import get_gallery_style, get_report
from easy_logs.ipfs_utils import MakeIPFS
from easy_logs.logs_db import yaml_representation_of_phy_logs
from easy_logs.resource_desc import DTR

__all__ = [
    "Pack",
]


class Pack(D8AppWithLogs):
    """
    Packs everything on IPFS

    """

    cmd = "dt-logs-ipfs-pack"

    deploy_ipfs = False

    def define_options(self, params):
        #        params.add_string('destination', help='Destination directory')
        #        params.add_flag('ipfs', help='Deploy on IPFS')
        params.accept_extra()

    def go(self):
        extra = self.options.get_extra()

        if not extra:
            query = "*"
        else:
            query = extra

        db = self.get_easy_logs_db()
        logs0 = db.query(query)
        logs = get_valid(logs0)
        print(f"logs: {len(logs)}")
        m = MakeIPFS()

        create_ipfs_dag(logs, m)

        def url_to_resource(log, rname):
            return log.log_name + "." + rname

        m.add_file_content("gallery_fancy.html", get_report(logs, url_to_resource))
        m.add_file_content("gallery.html", get_report(logs, url_to_resource, initial_screens=False))
        if True:
            print("adding cloud.yaml")
            m.add_file_content("cloud.yaml", yaml_representation_of_phy_logs(logs))
        m.add_file_content("style.css", get_gallery_style())
        m0 = MakeIPFS()

        m0.add_file("logs", m.get_ipfs_hash(), size=m.total_size())
        m0.add_file_content("index.html", get_index())

        hashed = m0.get_ipfs_hash()
        print(hashed)
        print((f"Total size :  {m.total_size() / (1000 * 1000 * 1000.0):.3f} GB"))


def get_valid(logs):
    logs_valid = {}
    for log_name, log in list(logs.items()):
        if log.valid:
            logs_valid[log_name] = log
    return logs_valid


def get_index():
    index = """

<html>
<head>
<title>Duckietown Logs Database</title>
<link href="logs/style.css" rel="stylesheet" type="text/css"></link>
</head>
<body>

<h1>Duckietown logs data</h1>

<pre>
    <a href="logs/gallery.html">Browse the gallery</a> (<a href="logs/gallery_fancy.html">fancy version</a>)

    <a href="logs/">See all the logs directory</a>

    <a href="logs/cloud.yaml">Download the database (YAML format)</a>


</pre>

<h2>Papers</h2>

<p>If you find these logs useful, please cite this paper: </p>

<p style='font-family:monospace'>
@inproceedings{paull17duckietown,<br/>
&nbsp; author = "Paull, Liam and Tani, Jacopo and Ahn, Heejin and Alonso-Mora, Javier and Carlone, 
Luca and Cap, Michal and Chen, Yu Fan and Choi, Changhyun and Dusek, Jeff and Hoehener, Daniel and Liu, 
Shih-Yuan and Novitzky, Michael and Okuyama, Igor Franzoni and Pazis, Jason and Rosman, Guy and Varricchio, 
Valerio and Wang, Hsueh-Cheng and Yershov, Dmitry and Zhao, Hang and Benjamin, Michael and Carr, 
Christopher and Zuber, Maria and Karaman, Sertac and Frazzoli, Emilio and Vecchio, Domitilla Del and Rus, 
Daniela and How, Jonathan and Leonard, John and Censi, Andrea",<br/>
&nbsp;     title = "Duckietown: an Open and Inexpensive and Flexible Platform for Autonomy Education and 
Research",<br/>
&nbsp; url = "http://duckietown.mit.edu/",<br/>
&nbsp; booktitle = "IEEE International Conference on Robotics and Automation (ICRA)",<br/>
&nbsp; year = "2017",<br/>
&nbsp; month = "May",<br/>
&nbsp; address = "Singapore"<br/>
}
</p>

</body>
</html>


"""
    return index


def create_ipfs_dag(logs, m):
    for id_log, log in list(logs.items()):
        for rname, res in list(log.resources.items()):
            dtr = DTR.from_yaml(res)
            ipfs = dtr.hash["ipfs"]

            filename = id_log + "." + rname
            # print ipfs, filename
            m.add_file(filename, ipfs, dtr.size)

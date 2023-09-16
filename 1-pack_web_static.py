#!/usr/bin/python3
"""
Fabric script that generates a .tgz archive from the contents of the
web_static folder of your AirBnB Clone repo, using the function do_pack
"""

from fabric.api import local
from datetime import datetime


def do_pack():
    """
    Pack contents of the web_static directory into .tgz archive
    """
    try:
        local("mkdir -p versions")
        current_time = datetime.now()
        time_format = current_time.strftime('%Y%m%d%H%M%S')
        file_path = "versions/web_static_{}.tgz".format(time_format)
        print(
            "Packing web_static to {}".format(
                file_path
            )
        )
        local(
            "tar -cvzf {} web_static".format(
                file_path
            )
        )
        return file_path
    except:
        return None

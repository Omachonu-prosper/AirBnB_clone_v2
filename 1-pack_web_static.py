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
		current_time = datetime.now()
		time_format = current_time.strftime('%Y%m%d%H%M%S')
		print("Packing web_static to versions/web_static_{}.tgz".format(time_format))
		local("tar -cvzf versions/web_static_{}.tgz web_static".format(time_format))
		return "versions/web_static_{}.tgz".format(time_format)
	except:
		return None

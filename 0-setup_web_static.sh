#!/usr/bin/env bash
# Sets up web servers for the deployment of web_static

sudo apt-get update
sudo apt-get install nginx -y

sudo mkdir /data/
sudo chown -R ubuntu:ubuntu /data/
sudo -u ubuntu mkdir /data/web_static/
sudo -u ubuntu mkdir /data/web_static/releases/
sudo -u ubuntu mkdir /data/web_static/shared/
sudo -u ubuntu mkdir /data/web_static/releases/test/
sudo echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo -u ubuntu tee /data/web_static/releases/test/index.html
sudo -u ubuntu ln -sf /data/web_static/releases/test/ /data/web_static/current

sudo echo "server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name _;
    add_header X-Served-By \$hostname;
    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    location /hbnb_static {
        alias /data/web_static/current/;
    }
}" | sudo tee /etc/nginx/sites-available/default

sudo service nginx restart

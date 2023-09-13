#!/usr/bin/env bash
# Sets up web servers for the deployment of web_static

sudo apt-get update
sudo apt-get install nginx -y

sudo mkdir /data/
sudo mkdir /data/web_static/
sudo mkdir /data/web_static/releases/
sudo mkdir /data/web_static/shared/
sudo mkdir /data/web_static/releases/test/
sudo chown -R $USER:$USER /data/
sudo echo "Initial setup for AirBnB_Clone" > /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

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
}" > /etc/nginx/sites-available/default

sudo service nginx restart
#!/bin/bash
set -e
deployUrl="/usr/share/nginx/html"
confUrl="/etc/nginx/nginx.conf"


while true; do
    read -p "Do you wish to install node modules? " yn
    case $yn in
        [Yy]* ) echo "Prefroming npm install..."; npm ci; break;;
        [Nn]* ) echo "Skipping npm install..."; break;;
        * ) echo "Please answer yes or no.";;
    esac
done


echo "Running build..."
npm run build --omit=dev
echo "Copy dist to $deployUrl"
cp -r dist/aqua-host $deployUrl
echo "Update nginx"
cp nginx.conf $confUrl
echo "Restart neginx"
systemctl reload nginx
echo "Deployment succesfull"

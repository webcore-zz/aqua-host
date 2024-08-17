#!/bin/bash
deployUrl="/usr/share/nginx/html"
confUrl="/etc/nginx/nginx.conf"

echo "Prefroming npm install..."
npm ci
echo "Running build..."
npm run build --omit=dev
echo "Copy dist to $deployUrl"
cp dist/aqua-host $deployUrl
echo "Update nginx"
cp nginx.conf $confUrl
echo "Restart neginx"
systemctl reload nginx
echo "Deployment succesfull"

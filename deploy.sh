#!/bin/bash
set -e
deployUrl="/usr/share/nginx/html"
confUrl="/etc/nginx/nginx.conf"

while true; do
    read -p "Do you wish to install node modules? " yn
    case $yn in
    [Yy]*)
        echo "Prefroming npm install..."
        npm ci
        echo "Running build..."
        ng build --configuration=production --verbose
        break
        ;;
    [Nn]*)
        echo "Skipping npm install..."
        while true; do
            read -p "Do you wish to run new build? " xx
            case $xx in
            [Yy]*)
                echo "Running build..."
                ng build --configuration=production --verbose
                break
                ;;
            [Nn]*)
                echo "Skipping new build..."
                break
                ;;
            *) echo "Please answer yes or no." ;;
            esac
        done
        break
        ;;
    *) echo "Please answer yes or no." ;;
    esac
done

echo "Clean up $deployUrl"
rm -rf "$deployUrl/*"
echo "Copy dist to $deployUrl"
cp -a dist/aqua-host/. $deployUrl
echo "Update nginx"
cp nginx.conf $confUrl
echo "Restart neginx"
systemctl reload nginx
echo "Deployment succesfull"

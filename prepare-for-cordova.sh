#!/bin/sh
set -e
set -u

# Prepares Angular APP to run for Cordova

echo "Updating Base Href for Cordova"
sed -i "s/<base href='\/'>/<base href='.\/'>/" www/index.html
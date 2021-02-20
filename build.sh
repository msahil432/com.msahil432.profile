#!/bin/sh
set -e
set -u

# Build Script

echo "-1. Installing Node Modules----"
npm i
npx cordova requirements
echo "NPM Install completed"

echo ""
echo "1. Update version number--------"
# Supports one build per minute
export TIMESTAMP=$(( $(date '+%s%N') / 10000000000))
export VERSION="2.0.$TIMESTAMP"
sed -i "s/1.0.0/2.0.$TIMESTAMP/" config.xml
echo "New Version created- \"$VERSION\""

echo ""
echo "2. Build Cordova ---------------"
npm run build:android:prod
echo "Build Cordova successful"


echo ""
echo "3. Build Android AAB Bundle ----"
cd ./platforms/android && ./gradlew bundleRelease
echo "AAB Bundle built"
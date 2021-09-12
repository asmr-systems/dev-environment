#!/usr/bin/env bash

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y curl

echo "Installing JLinkExe (SEGGER Toochain)..."
SEGGER_TOOLS_URL="https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.deb"
curl -X POST --silent \
     -F 'accept_license_agreement=accepted' \
     $SEGGER_TOOLS_URL \
     --output JLink_Linux_x86_64.deb
sudo apt install -y ./JLink_Linux_x86_64.deb

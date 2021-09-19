#!/usr/bin/env bash

DEPS=()
DEPS+=("git")
DEPS+=("curl")
DEPS+=("unzip")
DEPS+=("usbutils")
DEPS+=("emacs")
DEPS+=("openocd")
DEPS+=("gcc-arm-none-eabi")
DEPS+=("python3-venv")                 # python 3 virtual environment.
DEPS+=("python3-pip")                  # python 3 pip.

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y "${DEPS[@]}"


### JLink ###
if [ ! -f "/usr/bin/JLinkExe" ]
then
  echo "Installing JLinkExe (SEGGER Toochain)..."
  SEGGER_TOOLS_URL="https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.deb"
  curl -X POST --silent \
       -F 'accept_license_agreement=accepted' \
       $SEGGER_TOOLS_URL \
       --output JLink_Linux_x86_64.deb
  sudo apt install -y ./JLink_Linux_x86_64.deb
  rm ./JLink_Linux_x86_64.deb
else
  echo "JLink (SEGGER Toolchain) already installed."
fi

### ASMR Toolkit ###
pip install git+git://github.com/asmr-systems/toolkit@main

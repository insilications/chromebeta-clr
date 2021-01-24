#!/usr/bin/env bash

# Try to locate the original rpm under current directory
echo -e "\e[33m\xe2\x8f\xb3 Locating google-chrome-beta_current_x86_64.rpm...\e[m"
DOWNLOADURL="https://dl.google.com/linux/direct/google-chrome-beta_current_x86_64.rpm"
echo -e "\e[33m\xE2\x9C\x93 download URL is: $DOWNLOADURL"
curl -L -C - -O $DOWNLOADURL
INSTALLER="$(find . -maxdepth 1 | sort -r | grep --max-count=1 -oP "\.\/google-chrome-beta_current_x86_64.rpm")"
if [ "$INSTALLER" = '' ]; then
## Cannot download or find installer
    echo -e "\e[31m\xe2\x9d\x8c Cannot download or find google-chrome-beta_current_x86_64.rpm under current directory\e[m"
    exit 1
else
    echo -e "\e[33m\xE2\x9C\x93 Found google-chrome-beta_current_x86_64.rpm\e[m"
    VERSION="$(rpm -qip google-chrome-beta_current_x86_64.rpm | grep -oP "(?<=Version\s\s\s\s\s:\s)(\d+)(\.\d+)+")"
    echo -e "\e[33m\xE2\x9C\x93 latest version is: $VERSION"
    rpm2cpio google-chrome-beta_current_x86_64.rpm | cpio -ivdm --directory=$PWD
fi

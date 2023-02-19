#!/bin/bash

## Start logging backup activity
DATE=`date +%Y-%m-%d`
SCRIPT_DIR="$(cd $(dirname $0) && pwd)"
LOG_DIR=$SCRIPT_DIR/logs

if [ ! -d "$LOG_DIR" ]
then
  echo "Created log directory in script-folder"
  mkdir $SCRIPT_DIR/logs
fi

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>$DATE.app_installation.log 2>&1

echo "Updating system"

sudo apt update && sudo apt full-upgrade -y

echo "Installing essential packages"

sudo apt install software-properties-common apt-transport-https wget build-essential flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

## Install Signal ##

echo "Installing Signal"

wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

sudo apt update && sudo apt install signal-desktop -y

## Install VS Code ##

echo "Installing VS Code"

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt install code -y

## Install android-studio

sudo add-apt-repository ppa:maarten-fonville/android-studio -y
sudo apt update
sudo apt install android-studio

## Install Thunderbird ##

flatpak install -y --system flathub org.mozilla.Thunderbird

## Install Telegram

flatpak install -y --system flathub org.telegram.desktop

## Install Digikam

flatpak install -y --system flathub org.kde.digikam

## Install Steam

flatpak install -y --system flathub com.valvesoftware.Steam

## Install Firefox as flatpak and remove native version

flatpak install -y --system flathub org.mozilla.firefox
sudo apt remove firefox












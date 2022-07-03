#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Updating System
dnf update -y

# Making .config and Moving dotfiles and Background to .config
mkdir ~/.config
chown $(whoami): ~/.config
mv ./bspwm/* ~/.config
mv mic_over_mumble ~/mic_over_mumble
chmod +x ~/mic_over_mumble
# Installing Essential Programs 
dnf install sddm bspwm sxhkd  rofi polybar picom thunar nitrogen conky
# Installing Other less important Programs
dnf install firewall-config mumble mumble-server pulseaudio pulseaudio-utils snapd
# Installing Custom ocs-url package
dnf install ./rpm-packages/ocs-url-3.1.0-1.fc20.x86_64.rpm

#mumble 
sudo systemctl stop mumble-server.service
sudo systemctl disable mumble-server.service
ln -s /var/lib/snapd/snap /snap 
sleep 20
snap install avahi
# Installing fonts
dnf install fontawesome-fonts fontawesome-fonts-web
unzip FiraCode.zip -d /usr/share/fonts
unzip Meslo.zip -d /usr/share/fonts
unzip LiberationMono.zip -d /usr/share/fonts
unzip Agave.zip -d /usr/share/fonts
# Reloading Font
fc-cache -vf
# Removing zip Files
#rm ./FiraCode.zip ./Meslo.zip

# Enabling Services and Graphical User Interface
systemctl enable sddm
systemctl set-default graphical.target
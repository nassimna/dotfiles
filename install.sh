#!/bin/sh



if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Updating System
pacman -Syu
#PROGRAMS
# polybar bspwm rofi dmenu fish mumble murmur zsh dunst rxvt-unicode picom sxhkd nautilus unzip
pacman -S polybar bspwm rofi dmenu fish mumble murmur zsh dunst rxvt-unicode picom sxhkd nautilus unzip lxappearance adapta-gtk-theme
# MOVE EVERY THING TO HOME FOLDER ~

#bsp layout
curl https://raw.githubusercontent.com/phenax/bsp-layout/master/install.sh | bash -;
#mumble 
systemctl stop mumble-server.service
systemctl disable mumble-server.service 
#themes here https://wiki.archlinux.org/title/GTK

# Installing fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/LiberationMono.zip
unzip LiberationMono.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Agave.zip
unzip Agave.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip
unzip RobotoMono.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Noto.zip
unzip Noto.zip -d /usr/share/fonts
unzip fontawesome-free-5.15.4-desktop.zip -d /usr/share/fonts
unzip fontawesome-free-5.15.4-web.zip -d /usr/share/fonts
# Reloading Font
fc-cache -vf
# Removing zip Files
#rm ./FiraCode.zip ./Meslo.zip


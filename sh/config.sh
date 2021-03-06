#!/bin/bash

# Create direcotories
if [ ! -d ~/.logs/i3 ]; then
  mkdir -p ~/.logs/i3
fi

if [ ! -d ~/.logs/mpd]; then
  mkdir -p ~/.logs/mpd
fi

if [ ! -d ~/Screenshots ]; then
  mkdir -p ~/Screenshots
fi

if [ ! -d ~/Softwares ]; then
  mkdir -p ~/Softwares
fi

if [ ! -d ~/Documents ]; then
  mkdir -p ~/Documents
fi

if [ ! -d ~/Downloads ]; then
  mkdir -p ~/Downloads 
fi

if [ ! -d ~/Video ]; then
  mkdir -p ~/Video 
fi

if [ ! -d ~/Music ]; then
  mkdir -p ~/Music
fi

# Autostart mpd with systemd
systemctl --user enable mpd
systemctl --user start mpd

# Install oh-my-zsh configuration
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sed -i 's:ZSH_THEME="robbyrussell":ZSH_THEME="gentoo":' ~/.zshrc

# Copy configuration files to Home directory
pushd conf
cp -rf `cat list` ~
chmod 755 ~/.wm/rofi/*
popd

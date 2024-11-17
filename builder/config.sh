#!/bin/bash
#RUN THIS SCRIPT AFTER INSTALLING ARCH!
#Install yay
git -C /tmp clone https://aur.archlinux.org/yay.git
cd /tmp/yay && makepkg -si
#Install oh-my-posh
yay -S oh-my-posh
#Copy the .config directory
cp -r /dotfiles_i3/.config/ ~/
#Detect the user
username=$(whoami)
#Change the ownership of the .config file
directory="$HOME/.config"
sudo chown -R "$username:$username" "$directory"
#Allowing the system to execute polybar
sudo chmod +x $HOME/.config/polybar/launch.sh
#Copy the .local directory
cp -r /dotfiles_i3/.local/ ~/
#Command to refresh the fonts
fc-cache -fv
#Copy the .zshrc file
cp -r /dotfiles_i3/.zshrc ~/
#Copy .bashrc file
cp -r /dotfiles_i3/.bashrc ~/
#Copy .gitignore file
cp -r /dotfiles_i3/.gitignore ~/
#Copy .xprofile 
cp -r /dotfiles_i3/.xprofile ~/
#Copy the ohmyposhthemes
cp -r /dotfiles_i3/ohmyposh_themes ~/
#Create home directories
mkdir $HOME/Pictures $HOME/Downloads $HOME/Documents $HOME/Desktop
#Enable sddm 
sudo systemctl enable sddm
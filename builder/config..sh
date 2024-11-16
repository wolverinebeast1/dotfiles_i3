#Install AUR
git -C /tmp clone https://aur.archlinux.org/yay.git
cd /tmp/yay && makepkg -si
#Install oh-my-posh
yay -S oh-my-posh
#Copy the .config directory
cp -r /dotfiles/builder/.config/ ~/
#Copy the .local directory
cp -r /dotfiles/builder/.local/ ~/
#Command to refresh the fonts
fc-cache -fv
#Copy the .zshrc file
cp -r /dotfiles/.zshrc ~/
#Copy .bashrc file
cp -r /dotfiles/.bashrc ~/
#Copy .gitignore file
cp -r /dotfiles/.gitignore ~/
#Copy .xprofile 
cp -r /dotfiles/.xprofile ~/
#Copy the ohmyposhthemes
cp -r /dotfiles/ohmyposh_themes ~/
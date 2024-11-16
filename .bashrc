#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#Aliases:
alias ls='lsd' #replacing ls to lsd
alias cat='bat' #replacing cat to bat
alias install='sudo pacman -S' #alias to install packages
alias sync='sudo pacman -Sy' #alias to sync mirrors
alias updatesys='sudo pacman -Syu' #alias to update the system
alias cd='z' #alias for zoxide because typing z all the time is annoying 
alias man='tldr' #better man command
alias vim='nvim' #replacing classic with neovim
alias movies='sudo mount -o rw /dev/sdb1 /media/movies' #temporary -> fstab
alias night='redshift -O 3700K' #redshift
alias pip='venv/bin/pip' #using pip as virtual environment

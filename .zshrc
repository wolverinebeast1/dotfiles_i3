#Config file inspired by: https://github.com/dreamsofautonomy/zensh/blob/main/.zshrc

#Ohmyposh theme selector -> You can use powerlever10k if you want
eval "$(oh-my-posh init zsh --config ~/ohmyposh_themes/sonicboom.omp.json)"
#Aliases:
alias ls='lsd' #replacing ls to lsd
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
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
alias icat='kitten icat'
#Directories for zinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions
autoload -Uz compinit && compinit

# Checks if .zsh_history file is created
if [ ! -f ".zsh_history" ]; then
	touch "$HOME/.zsh_history"
fi

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Zoxide configuration
eval "$(zoxide init zsh)"
export GTK_THEME=Dracula


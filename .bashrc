 # .bashrc

# _______   ___       ________  _____ ______      
# |\  ___ \ |\  \     |\   __  \|\   _ \  _   \    
# \ \   __/|\ \  \    \ \  \|\  \ \  \\\__\ \  \   
#  \ \  \_|/_\ \  \    \ \  \\\  \ \  \\|__| \  \  
#   \ \  \_|\ \ \  \____\ \  \\\  \ \  \    \ \  \ 
#    \ \_______\ \_______\ \_______\ \__\    \ \__\
#     \|_______|\|_______|\|_______|\|__|     \|__|
#                                                  
#                                                  
#                                                  

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc


#######################################################
# MACHINE SPECIFIC ALIAS'S
#######################################################

# Long vertical listing
alias ll='ls -alFh'

# Trash-CLI - put files in trash
alias rm='trash -v'

# Set the default editor
alias vim='nvim'
alias cls='clear'

# git alias for interacting with configuration repository
alias config='/usr/bin/git --git-dir=/home/elomwarren/.cfg/ --work-tree=/home/elomwarren'

# SPECIAL FUNCTIONS

# >>> conda initialize >>>
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
# <<< conda initialize <<<

#######################################################

# starship config #
eval "$(starship init bash)"

# Atuin - Shell History - using Homebrew
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

# The fuck
eval "$(thefuck --alias)"

# init zoxide - a better cd : should be at the end of the config file
eval "$(zoxide init --cmd cd bash)"

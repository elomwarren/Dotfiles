#############################################################
#                       FISH CONFIG                         #
#############################################################


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


# Add Homebrew to PATH for fish
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)


if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source # init fish goes here
end

# Add atuin directory /home/elomwarren/.cargo/bin to PATH
set -x PATH "/home/linuxbrew/.linuxbrew/bin" $PATH


# Fish greeting
function fish_greeting
    echo "What is your main goal for today???"
    fastfetch
end


# Install Starship
starship init fish | source

# Alias to mimic bash alias "update"
alias update "bash -c 'sudo dnf upgrade'"

# Function to open a file !! IS it necessary?
function open_file
    # Check if the file exists
    if test -f $argv[1]
        # Open a new terminal with NeoVim and the specified file
        nvim $argv[1]
    else
        echo "File $argv[1] does not exist."
    end
end

# Define an alias to open a terminal with a specific file
alias todo='open_file ~/Desktop/todo.txt'

# Trash-CLI alias
alias rm 'trash -v'

# Source config.fish
alias source_fish "source ~/.config/fish/config.fish"

# Long listing of files
alias ll 'ls -alFh'

# Vim alias
alias vim 'nvim'

# Alias to clear terminal
alias cls 'clear'

# git alias for interacting with configuration repository
alias config '/usr/bin/git --git-dir=/home/elomwarren/.cfg/ --work-tree=/home/elomwarren'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/elomwarren/miniconda3/bin/conda
    eval /home/elomwarren/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/elomwarren/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/elomwarren/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/elomwarren/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<



# init zoxide - a better cd - should be at the end of the config file
zoxide init fish | source


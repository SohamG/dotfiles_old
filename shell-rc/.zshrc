# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/sohamg/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simple"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
####Personal
## Stolen from https://github.com/simoniz0r/.zshrc/
setopt no_nullglob
setopt no_nomatch
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep --color=auto"
alias -g N=">/dev/null"
# Decompress any archive type
x () {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.*|*.tar)
                tar -xf "$1"
                ;;
            *.bz2)
                bunzip2 "$1"
                ;;
            *.rar)
                unrar x "$1"
                ;;
            *.gz)
                gunzip "$1"
                ;;
            *.jar|*.zip)
                unzip "$1"
                ;;
            *.Z)
                uncompress "$1"
                ;;
            *.deb)
                ar x "$1"
                ;;
            *)
                echo "'$1' cannot be extracted"
                ;;
        esac
    else
        echo "'$1' is not a file"
    fi
}

alias gst="git status"



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient --c"                  # $EDITOR opens in terminal
# export VISUAL="emacsclient --c -a emacs"         # $VISUAL opens in GUI mode

#Startx Automatically
# if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
#     startx :1
# fi

emc(){
    emacsclient $argv --c -a emacs & disown;
}

emt(){
    emacsclient $argv -t;
}
gra(){
    git remote add $argv;
}

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}

export NVM_DIR="/home/sohamg/.nvm"
[ -s "/nvm.sh" ] && \. "/nvm.sh"  # This loads nvm
[ -s "/bash_completion" ] && \. "/bash_completion"  # This loads nvm bash_completion

export QT_QPA_PLATFORMTHEME="qt5ct"


# testing
test(){
    echo $argv;
}

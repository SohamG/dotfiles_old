# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/sohamg/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simple"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#export FZF_BASE=/home/sohamg/.fzf/

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient --c"                  # $EDITOR opens in terminal
# export VISUAL="emacsclient --c -a emacs"         # $VISUAL opens in GUI mode

#Startx Automatically
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx :1
fi

emc(){
    emacsclient $argv --c -a emacs & disown;
}

emt(){
    emacsclient $argv -t;
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

# define right prompt, regardless of whether the theme defined it
#RPS1='$(vi_mode_prompt_info)'
#RPS2=$RPS1
#bindkey -v
#export KEYTIMEOUT=1
#bindkey -M vicmd "." insert-last-word
#bindkey -M vicmd '?' history-incremental-search-backward
export NVM_DIR="/home/sohamg/.nvm"
[ -s "/nvm.sh" ] && \. "/nvm.sh"  # This loads nvm
[ -s "/bash_completion" ] && \. "/bash_completion"  # This loads nvm bash_completion

export QT_QPA_PLATFORMTHEME="qt5ct"


# testing
test(){
    echo $argv;
}

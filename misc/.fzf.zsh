# Setup fzf
# ---------
if [[ ! "$PATH" == */home/sohamg/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/sohamg/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/sohamg/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# source "/home/sohamg/.fzf/shell/key-bindings.zsh"

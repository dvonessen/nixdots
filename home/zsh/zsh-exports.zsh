# Append path with users local bin dir
PATH=~/.local/bin:$PATH
# History
export HISTFILE=$XDG_CACHE_HOME/zhistory
export HISTSIZE=100000      # Nearly infinite history; essential to building a cli 'library' to use with fzf/etc
export SAVEHIST=100000

# Default editor
export EDITOR="vim"

# Default pager
export PAGER="less"
# --RAW-CONTROL-CHARS:   translate raw escape sequences to colors
# --squeeze-blank-lines: no more than one blank line in a row
# --quit-on-intr:        quit on interrupt, e.g. C-c
# --quit-if-one-screen:  quit if content fills less than the screen
# --no-init:             don't clear screen on exit
# --mouse:               support mouse - only less version >=551 (`brew install less` on mac)
export LESS='--RAW-CONTROL-CHARS --squeeze-blank-lines --quit-on-intr --quit-if-one-screen --no-init --mouse'

# Terminal configuration
export TERM=xterm-256color # True Color support in terminals and TUI programs that support it (e.g. vim)

# Ensure locale is set language variables
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export C_TIME=en_US.UTF-8
export C_ADDRESS=de_DE.UTF-8
export C_IDENTIFICATION=de_DE.UTF-8
export C_MEASUREMENT=de_DE.UTF-8
export C_MONETARY=de_DE.UTF-8
export C_NAME=de_DE.UTF-8
export C_NUMERIC=de_DE.UTF-8
export C_PAPER=de_DE.UTF-8
export C_TELEPHONE=de_DE.UTF-8

# # Enable pyenv if ~/.pyenv is present
# if [ -d "$HOME/.local/share/pyenv" ]; then
#   export PYENV_ROOT="$HOME/.local/share/pyenv"
#   export PATH=$PYENV_ROOT/bin:$PATH
#   eval "$(pyenv init -)"
# fi

# Export gpg-agent's TTY to allow access to it.
export GPG_TTY=$(tty)

# Export to circumvent forking failure
# See: [__NSPlaceholderDate initialize] may have been in progress in
# another thread when fork() was called.
# This is an ansible workaround
if [ $(uname) = "Darwin" ]; then
    export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
fi

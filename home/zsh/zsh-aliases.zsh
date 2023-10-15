# Kubernetes aliases
alias k="kubectl"
alias kns="kubens"
alias kct="kubectx"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hgrep='history 0 |grep --color=auto '
alias fuck='sudo !!'
alias please=fuck
alias ports='netstat -tlpen'
# git aliase
alias ggrep='git grep'
alias gst='git status'
alias gad='git add'
alias gadd=gad
alias gcom='git commit -v'
alias gcof='git commit -m "f"'
alias gcoam='git commit -v --amend'
alias gri='git rebase -i'
alias gsta='git stash'
alias gsto='git stash pop'
alias gstl='git stash list'
alias gom=gcom
alias giff='git diff'
# No glob aliases
alias find='noglob find'
alias systemctl='noglob systemctl'
# Alias for sourcing .zshrc
alias zre='source $HOME/.zshrc'

# List files and dirs in color
alias ll='ls -lFh --color=auto'
alias l=ll
alias la='ls -lAFh'
alias ls='ls --color=auto'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Tailing logfiles
alias t='tail -f'

alias df="df -h"

# Either use pacman or yay (if available) to upgrade system.
_sysupgrade() {
    test $(id -u) = 0 && SUDO="" || SUDO="sudo"
    test -x $(command -v yay) && UPGRADE_CMD="yay -Syu" || test -x $(command -v pacman) && UPGRADE_CMD="$SUDO pacman -Syu"
    test -x $(command -v dnf) && UPGRADE_CMD="$SUDO dnf update"
    test -x $(command -v flatpak) && UPGRADE_CMD="$UPGRADE_CMD && flatpak update && flatpak update --user"
    echo $UPGRADE_CMD
    eval $UPGRADE_CMD
}
alias sysupgrade=_sysupgrade

# Set aliases for cat to bat if bat exists.
if command -v bat &> /dev/null; then
    if [ $(uname) = "Darwin" ]; then
        alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"
    else
        alias cat="bat"
    fi
fi

# Alias grep with ripgrep to have a better grep tool.
if command -v rg &> /dev/null; then
    alias grep="rg"
fi

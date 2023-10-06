# Some Special options
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' special-dirs true
zstyle ':completions:*' cache-path $XDG_CACHE_HOME/.zcompcache-$ZSH_VERSION
# Make zsh now about ssh accessed hosts
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

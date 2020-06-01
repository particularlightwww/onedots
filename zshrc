source ~/.aliasrc
PROMPT='%(?.%F{green}%T.%F{red}%T)%f %B%F{white}%1~%f%b » ' 
TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
autoload -U compinit
compinit
zstyle ':completion:*' menu select
setopt completealiases
autoload -U compinit && compinit
setopt HIST_IGNORE_DUPS
zstyle ':completion:*' rehash true
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic


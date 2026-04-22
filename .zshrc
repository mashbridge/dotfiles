# .zshrc sets the env for interactive shells.
#
# There's a lot of overlap withe .zshenv, but this one is loaded after .zprofile.
#
# Order of execution: .zshenv → .zprofile → .zshrc → .zlogin → .zlogout

export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagacad"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

alias vi='/opt/homebrew/bin/vim'
alias vim=vi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

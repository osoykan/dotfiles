# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f ~/.bash_profile ]; then 
    . ~/.bash_profile;
fi

export ZSH="$HOME/.oh-my-zsh"
export GO111MODULE=on
export GOPATH=$HOME/go
export UPDATE_ZSH_DAYS=10
export DISABLE_UPDATE_PROMPT=true # accept updates by default
export EDITOR=vim
export SBT_OPTS="-Xms1G -Xmx4G -Xss1M -Djava.net.preferIPv4Stack=true -Djavax.net.ssl.trustStore=cacerts -Djavax.net.ssl.trustStorePassword=changeit"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$GOPATH/bin:$PATH
export PATH=$JAVA_HOME/jre/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

DEFAULT_USER=$(whoami)
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  z
  command-not-found
  history-substring-search
  history
  ssh-agent
  zsh-fzf-history-search
)
autoload -Uz compinit
autoload predict-on
compinit

zstyle :omz:plugins:ssh-agent identities osoykan_github trendyol
ZSH_THEME="powerlevel10k/powerlevel10k"

# Load custom functions
if [[ -f "$HOME/Projects/github/osoykan/dotfiles/.zsh_functions.inc" ]]; then
	source "$HOME/Projects/github/osoykan/dotfiles/.zsh_functions.inc"
else
	echo >&2 "WARNING: can't load shell functions"
fi

# Load custom aliases
if [[ -f "$HOME/Projects/github/osoykan/dotfiles/.zsh_aliases.inc" ]]; then
	source "$HOME/Projects/github/osoykan/dotfiles/.zsh_aliases.inc"
else
	echo >&2 "WARNING: can't load shell aliases"
fi

# iTerm2 integration
if [ -e "${HOME}/.iterm2_shell_integration.zsh" ]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
else
  log "WARNING: skipping loading iterm2 shell integration"
fi

# source $HOME/.antigen.zsh
yadr=$HOME/.yadr

# fzf completion. run $HOMEBREW/opt/fzf/install to create the ~/.fzf.* script
# brew install fzf
# To install useful key bindings and fuzzy completion:
# $(brew --prefix)/opt/fzf/install
if type fzf &>/dev/null && [ -f ~/.fzf.zsh ]; then
	source ~/.fzf.zsh
else
	log "WARNING: skipping loading fzf.zsh"
fi

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

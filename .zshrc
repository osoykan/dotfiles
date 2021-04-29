# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export GOPATH=$HOME/go
export UPDATE_ZSH_DAYS=10
export DISABLE_UPDATE_PROMPT=true # accept updates by default
export EDITOR=vim
export SBT_OPTS="-Xms1G -Xmx4G -Xss1M -Djava.net.preferIPv4Stack=true -Djavax.net.ssl.trustStore=cacerts -Djavax.net.ssl.trustStorePassword=changeit"
export JAVA_HOME=$(/usr/libexec/java_home)
export CLOUDSDK_PYTHON=python2
export PATH=$GOPATH/bin:$PATH
export PATH=$JAVA_HOME/jre/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

autoload -Uz compinit
autoload predict-on
compinit
DEFAULT_USER=$(whoami)

zstyle :omz:plugins:ssh-agent identities id_rsa

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  z
  command-not-found
  history-substring-search
  history
  ssh-agent
)

# Load custom functions
if [[ -f "$HOME/Projects/github/dotfiles/.zsh_functions.inc" ]]; then
	source "$HOME/Projects/github/dotfiles/.zsh_functions.inc"
else
	echo >&2 "WARNING: can't load shell functions"
fi

# Load custom aliases
if [[ -f "$HOME/Projects/github/dotfiles/.zsh_aliases.inc" ]]; then
	source "$HOME/Projects/github/dotfiles/.zsh_aliases.inc"
else
	echo >&2 "WARNING: can't load shell aliases"
fi

# iTerm2 integration
if [ -e "${HOME}/.iterm2_shell_integration.zsh" ]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
else
  log "WARNING: skipping loading iterm2 shell integration"
fi

source /usr/local/share/antigen/antigen.zsh
source $ZSH/oh-my-zsh.sh
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

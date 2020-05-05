export ZSH="$HOME/.oh-my-zsh"
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export UPDATE_ZSH_DAYS=10
export DISABLE_UPDATE_PROMPT=true # accept updates by default
export EDITOR=vim

autoload -Uz compinit
autoload predict-on
compinit
DEFAULT_USER=$(whoami)
 
ZSH_THEME="agnoster"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  z
  command-not-found
  history-substring-search
  history
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

# kubectl completion (w/ refresh cache every 48-hours)
if command -v kubectl > /dev/null; then
	kcomp="$HOME/.kube/.zsh_completion"
	if [ ! -f "$kcomp" ] ||  [ "$(( $(date +"%s") - $(stat -c "%Y" "$kcomp") ))" -gt "172800" ]; then
		mkdir -p "$(dirname "$kcomp")"
		kubectl completion zsh > "$kcomp"
		log "refreshing kubectl zsh completion to $kcomp"
	fi
	source "$kcomp"
fi

# kubectl aliases from https://github.com/ahmetb/kubectl-alias
#    > use sed to hijack --watch to watch $@.
[ -f ~/.kubectl_aliases ] && source \
	<(cat ~/.kubectl_aliases | sed -E 's/(kubectl.*) --watch/watch\1/g')

source /usr/local/share/antigen/antigen.zsh
source $ZSH/oh-my-zsh.sh
 
yadr=$HOME/.yadr

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# fzf completion. run $HOMEBREW/opt/fzf/install to create the ~/.fzf.* script
# brew install fzf
# To install useful key bindings and fuzzy completion:
# $(brew --prefix)/opt/fzf/install
if type fzf &>/dev/null && [ -f ~/.fzf.zsh ]; then
	source ~/.fzf.zsh
else
	log "WARNING: skipping loading fzf.zsh"
fi

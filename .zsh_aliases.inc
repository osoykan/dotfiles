# This script is sourced from .zshrc.

alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version"

# Add GNU tools not linked by Homebrew.
alias find='gfind'
alias xargs='gxargs'
alias stat='gstat'

# convenience aliases
alias cd..='cd ..'
alias cd...='cd ../..'
alias ls='ls --color'
alias l='ls -lF'
alias dir='ls'
alias la='ls -lah'
alias ll='ls -l'
alias ls-l='ls -l'
alias j='jobs'
alias time='gtime --format "$(tput setab 255)$(tput setaf 160)took %es.$(tput sgr0)"'
alias vi='vim'
alias grep='grep -E --color'
alias ping='ping -c 3'
alias pstree='pstree -w'
alias c='pbcopy'
alias p='pbpaste'
alias pt='pbpaste | tee'
alias t='tee'
alias slp='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias bd='bg && disown %1'
alias pg='ps ax | grep -v "grep" | grep'
alias o='less'
alias no='yes n'
alias cl='clear;clear'
alias page='less -S'
alias start=open
alias ccat='ccat --bg=dark'
alias c.='code .'
alias code.='code .'
alias fd='fd --no-ignore'
alias ag='ag --hidden'

# cloud stuff
alias d='docker'
alias dr='docker run --rm -i -t'
alias dx='docker exec -i -t'
alias db='docker build -t'

# google cloud platform
alias gcurl='curl -k --header "Authorization: Bearer $(gcloud auth print-access-token -q)"'
alias gke='gcloud container clusters'
alias gkedel='gcloud container clusters delete -q --async'
alias gce='gcloud compute instances'
alias gcssh='gcloud compute ssh'
alias run='gcloud run deploy --region us-central1 --platform=managed --allow-unauthenticated --image'
alias runlist='gcloud run services list --platform=managed'
alias rundel='gcloud run services delete -q --platform=managed'

# git aliases
 alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='emacsclient .gitignore &'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
alias gbd='git b -D'
alias gdc='git diff --cached'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'


# kubectl
alias kx='kubectl explain'
alias pka='pbpaste | kubectl apply -f-'
alias pkr='pbpaste | kubectl delete -f-'
alias pkd='pbpaste | kubectl describe -f-'
alias kpl='kubectl plugin'
alias krew_install_clipboard='kubectl krew install --manifest <(pbpaste)'


# misc shortcuts
alias tunneloff='networksetup -setsocksfirewallproxystate Wi-Fi off && echo Tunnel is turned off.'
alias tunnel='networksetup -setsocksfirewallproxystate Wi-Fi on && ssh -N -p 22 -D 8080 mine; networksetup -setsocksfirewallproxystate Wi-Fi off; echo Tunnel is turned off.'
alias ffmpeg='docker run --rm -i -t -v $PWD:/tmp/workdir jrottenberg/ffmpeg'
alias youtube-dl='docker run --rm -i -t -v $PWD:/data vimagick/youtube-dl'
alias goclone='$HOME/workspace/goclone/goclone'

alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'
alias zr='source ~/.zshrc'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias ..='cd ..'
alias cdb='cd -'

# Show human friendly numbers and colors
alias df='df -h'
alias ll='ls -alGh'
alias ls='ls -Gh'
alias du='du -h -d 2'

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
alias ae='emacsclient .ocood/zsh/aliases.zsh &' #alias edit
alias ar='source $yadr/zsh/aliases.zsh'  #alias reload

# zsh profile editing
alias ze='emacsclient ~/.zshrc &'

alias _='sudo'
alias __='sudo !!'

#goland 

alias goland='/usr/local/bin/goland' 

#go latest
alias golat='go1.18rc1'

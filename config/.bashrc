echo 'Sourcing custom ~/.bashrc...'

# reload bash
function rbash() {
    . ~/.bash_profile
}

# read a node from package.json
function pkgread () {
    cat package.json | json "$1"
}

function killport () {
    lsof -i tcp:$1 |
    awk 'NR!=1 {print $2}' |
    xargs kill
}

function showcommits () {
    git log --pretty=format:"%h%x09%an%x09%ad%x09%s" --first-parent $1..$2
}

# add git branch to prompt
function parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# change bash prompt to include git branch
export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] 🔥 "

# change default editor and add code as command
export CODE=code
export EDITOR=$CODE

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ignore casing in terminal
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# the fuck https://github.com/nvbn/thefuck
alias f="fuck"
eval "$(thefuck --alias)"

# nvm
nvm use 10.15.0

# custom aliases
# applications
alias gc='google-chrome'
alias ff='firefox'

# commands
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias bashprofile='vim ~/.bash_profile'
alias c='clear'
alias ys='yarn start'
alias yd='yarn dev'
alias updatenpmrepo='git reset --hard && git pull && npm install'
alias updateyarnrepo='git reset --hard && git pull && yarn install'
alias nd="node debug"
alias ndebug="node-debug --no-preload --save-live-edit"
alias bd="boot2docker"
alias bds="boot2docker start"
alias dk="docker"
alias dkr="docker run"
alias abash="pbcopy < ~/.bash_profile &&  pbpaste > ~/Dropbox/CloudFiles/ARCHIVES/bash_profile/bash$(date "+%Y%m%d-%H%M%S").txt && echo 'ARCHIVED BASH'"
alias ni="npm install"
alias ns="npm start"
alias nr="npm run"
alias nl="npm run lint --fix"
alias lco="npm run lint:css:order"
alias nt="npm run test:coverage"
alias nrs="npm run serve"
alias yi="yarn install"
alias yd="yarn dev"
alias getextensions="code --list-extensions | xargs -L 1 echo code --install-extension"
alias getGitChanges='echo "git log old_commit_hash..new_commit_hash | grep -E \"Merged\""'
alias stopcontainers="docker kill $(docker ps -q)"
alias rmcontainers="docker rm $(docker ps -a -q)"
alias rmimages="docker rmi $(docker images -q)"

# git
alias gac='git add . && git commit'
alias status='git status'
alias s='git status'
alias gb="git branch --sort=committerdate"
alias gbr="git branch | grep -v "master" | xargs git branch -D"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gl="git log"
alias glo="git log --pretty=oneline"
alias gst="git stash"
alias gstp="git stash pop"
alias glu="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias gt="git tag"
alias gprom="git pull --rebase origin master"
alias grm="git rebase master"
alias grs="git reset"
alias grv="git revert"
alias gm="git merge"
alias gpom="git push origin master"
alias gpfom="git push -f origin master"
alias gpum="git pull origin master"
alias gd="git diff"
alias gpo="git push origin"
alias gob="git checkout -b"

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias pdf="cd ~/Documents/pdfs"
alias desktop="cd ~/Desktop"
alias dropbox="cd ~/Dropbox"
alias home="cd ~"
alias udemy="cd ~/Dropbox/Udemy"
alias downloads="cd ~/Downloads"
alias download="cd ~/Downloads"
alias onedrive="cd ~/OneDrive"
alias docs="cd ~/Documents"
alias snip="cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/"
alias obash="open ~/.bash_profile"
alias gssh="cd ~/.ssh"
alias py="python"
alias osu="open -a Sublime\ Text\ 2"
alias vlc="open -a VLC"
alias downloads="cd ~/Downloads"

# greet the user with the current timestamp
echo "Hi $USER! It is $(date '+%A %B %d %Y %r') and time to code!"

echo 'Sourcing custom ~/.bash_aliases...'

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
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias install='sudo apt-get install'
alias pgadmin='python /usr/local/lib/python2.7/dist-packages/pgadmin4/pgAdmin4.py'
alias startcass='sudo systemctl start cassandra && export CQLSH_NO_BUNDLED=true && cqlsh -u cassandra -p cassandra'
alias c='clear'

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
alias gpom='git push origin master'
alias gphm='git push heroku master'
alias gpb='git push origin master && git push heroku master'
alias gac='git add . && git commit'
alias status='git status'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias b='cd -'
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
alias processing='~/processing/processing'
alias downloads="cd ~/Downloads"
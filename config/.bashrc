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

# run config depending on operating system
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Linux
        # ~/.bashrc: executed by bash(1) for non-login shells.
        # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
        # for examples

        # If not running interactively, don't do anything
        case $- in
            *i*) ;;
            *) return;;
        esac

        # don't put duplicate lines or lines starting with space in the history.
        # See bash(1) for more options
        HISTCONTROL=ignoreboth

        # append to the history file, don't overwrite it
        shopt -s histappend

        # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
        HISTSIZE=1000
        HISTFILESIZE=2000

        # check the window size after each command and, if necessary,
        # update the values of LINES and COLUMNS.
        shopt -s checkwinsize

        # If set, the pattern "**" used in a pathname expansion context will
        # match all files and zero or more directories and subdirectories.
        #shopt -s globstar

        # make less more friendly for non-text input files, see lesspipe(1)
        [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

        # set variable identifying the chroot you work in (used in the prompt below)
        if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
            debian_chroot=$(cat /etc/debian_chroot)
        fi

        # set a fancy prompt (non-color, unless we know we "want" color)
        case "$TERM" in
            xterm-color|*-256color) color_prompt=yes;;
        esac

        # uncomment for a colored prompt, if the terminal has the capability; turned
        # off by default to not distract the user: the focus in a terminal window
        # should be on the output of commands, not on the prompt
        #force_color_prompt=yes

        if [ -n "$force_color_prompt" ]; then
            if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
            # We have color support; assume it's compliant with Ecma-48
            # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
            # a case would tend to support setf rather than setaf.)
            color_prompt=yes
            else
            color_prompt=
            fi
        fi

        # Add git branch if its present to PS1

        parse_git_branch() {
            git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
        }

        if [ "$color_prompt" = yes ]; then
            PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u ➡️  \[\033[01;34m\]\W\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]🔥  '
            else
            PS1='${debian_chroot:+($debian_chroot)}\u ➡️  \W$(parse_git_branch)🔥  '
        fi
        unset color_prompt force_color_prompt

        # If this is an xterm set the title to user@host:dir
        case "$TERM" in
        xterm*|rxvt*)
            PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
            ;;
        *)
            ;;
        esac

        # enable color support of ls and also add handy aliases
        if [ -x /usr/bin/dircolors ]; then
            test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
            alias ls='ls --color=auto'
            #alias dir='dir --color=auto'
            #alias vdir='vdir --color=auto'

            alias grep='grep --color=auto'
            alias fgrep='fgrep --color=auto'
            alias egrep='egrep --color=auto'
        fi

        # colored GCC warnings and errors
        #export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

        # some more ls aliases
        alias ll='ls -alF'
        alias la='ls -A'
        alias l='ls -CF'

        # Add an "alert" alias for long running commands.  Use like so:
        #   sleep 10; alert
        alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

        # Alias definitions.
        # You may want to put all your additions into a separate file like
        # ~/.bash_aliases, instead of adding them here directly.
        # See /usr/share/doc/bash-doc/examples in the bash-doc package.

        if [ -f ~/.bash_aliases ]; then
            . ~/.bash_aliases
        fi

        # enable programmable completion features (you don't need to enable
        # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
        # sources /etc/bash.bashrc).
        if ! shopt -oq posix; then
            if [ -f /usr/share/bash-completion/bash_completion ]; then
                . /usr/share/bash-completion/bash_completion
            elif [ -f /etc/bash_completion ]; then
                . /etc/bash_completion
            fi
        fi

        cd ~/Projects
        echo "Hi $USER! It is $(date '+%A %B %d %Y %r') and time to code! 🔥"

        export NVM_DIR="/home/avincenthill/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX

        # nvm
        # load nvm for MacOS
        [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
        nvm use 10.15.0

        # greet the user with the current timestamp
        echo "Hi $USER! It is $(date '+%A %B %d %Y %r') and time to code! 🔥"
fi

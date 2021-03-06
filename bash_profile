PATH=/usr/local/bin:/usr/local/mysql/lib:/Applications/Postgres.app/Contents/MacOS/bin:/usr/local/mysql/bin:$PATH

# adding cargo to path
PATH=/Users/omardelarosa/.cargo/bin:$PATH

# adding home bin and yarn bin to path
export PATH=$HOME/bin:$HOME/.yarn/bin:$PATH

# MySQL fix for python
# export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# Mopidy Python Fix
# export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH

### load environment vars
if [ -f ~/.env ]; then
    source ~/.env
fi

if [ -f ~/.aws ]; then
    source ~/.aws
fi

### load aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

if [ -f ~/.other_shortcuts ]; then
  source ~/.other_shortcuts
fi

### Git Completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

### Command Shortcuts
alias ll="ls -al"
alias cpdir="cp -R"
alias vim="nvim"

### get bash profile quickly
alias getbash="vim ~/.bash_profile"
alias setbash="source ~/.bash_profile"

### get env vars quickly
alias getenv="vim ~/.env"

### get vimrc quickly
alias getvim="vim ~/.config/nvim/init.vim"

### spin up ubuntu linux via docker
alias getlinux="docker run -i -t ubuntu /bin/bash"

### JSON tools

function pjson() {

  # use underscore-cli if available
  if (type underscore &> /dev/null); then
    local json="underscore print --color"
  else
  # use python json.tool if not
    local json="python -m json.tool"
  fi

  if [[ $1 != "" ]]; then
    cat $1 | $json
  else
    $json
  fi
}

### Launch Tiny Node Webserver
alias tnws="coffee /usr/local/bin/tnws.coffee"

#### Launch Tiny Python Server
alias pyserv="python -m SimpleHTTPServer"

### Folder Shortcuts
export DROPBOX_PATH=$HOME/Dropbox
export CODE_PATH=$DROPBOX_PATH/Code
export WDI_PATH=$CODE_PATH/WDI
export BREW_PATH=/usr/local/Cellar

alias cdwdi5="cd $WDI_PATH/wdi"
alias cdwdi7="cd $WDI_PATH/wdi7"
alias cdwdi7work="cd $WDI_PATH/wdi7/WDI_NYC_7_Work"
alias cdwdi7main="cd $WDI_PATH/wdi7/WDI_NYC_7"
alias cdwdi7curriculum="cd $WDI_PATH/WDI_Curriculum"
alias cdwdidocs="cd $WDI_PATH"
alias cddrop="cd $DROPBOX_PATH"
alias cdruby="cd $CODE_PATH/Ruby"
alias cdscala="cd $CODE_PATH/Scala"
alias cdcode="cd $CODE_PATH"
alias cddl="cd $HOME/Downloads"
alias cdsites="cd $HOME/Sites"
alias cddesktop="cd $HOME/Desktop"
alias rpissh="ssh pi@192.168.0.6"
alias dotfiles="cd $CODE_PATH/dotfiles"

### RVM shortcuts
alias rvm193="rvm use ruby-1.9.3-p392"
alias rvm2="rvm use ruby-2.0.0-p247"

### Git shortcuts
alias gcheck="git checkout"
alias gadd="git add -A"
alias gstat="git status"
alias gcom="git commit -m"
alias gpom="git push origin master"
alias plog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --color"

## Misc. Utilities

alias rsa2clipboard="pbcopy < ~/.ssh/id_rsa.pub"

## Terminal Color Theme

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


### Custom Prompt / Colorization

# Displays Git Branch in Command Prompt

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
}

# Prompt 1: "username@hostname:"
PS1="\[$(tput setaf 1)\]\e[\e[34;40m\u\e[m@"

# Prompt 2: "path/to/where/you/are"
PS1="$PS1\e[32;40m\w\e[m"

# Prompt 3: "(gitbranch)"
PS1="$PS1 \$([[ -n \$(git branch 2> /dev/null) ]] && echo \" \")\[\033[1;33m\]\$(parse_git_branch)\[\033[1;37m\]\n\$ \[$(tput sgr0)\]"

# PS1="$txtylw\w$txtgrn\$(branch)$txtwht ∴$txtrst "
##

#### General Assemb.ly/WDI Stuff

# Ethan's JS loader

function wget_js(){

  wget http://code.jquery.com/jquery-1.11.0.js
  wget http://underscorejs.org/underscore.js
  wget http://backbonejs.org/backbone.js
  wget https://raw.github.com/visionmedia/mocha/master/mocha.js
  wget https://raw.github.com/visionmedia/should.js/master/should.js
  mv jquery-1.11.0.js jquery.js

}


# A function that jumps to a particular wk/day folder in the class repo

function wdi() {
  local WEEK_NUM=$1
  local DAY_NUM=$2
  local BASE_PATH="$WDI_PATH/wdi-string"
  if [ "$WEEK_NUM" != "" ] && [ "$DAY_NUM" != "" ]
  then
    local WEEK_STRING="/w$WEEK_NUM"
    local DAY_STRING="/d$DAY_NUM"
    if [ -e $BASE_PATH$WEEK_STRING$DAY_STRING ]
    then
      cd $BASE_PATH$WEEK_STRING$DAY_STRING;
    else
      cd $BASE_PATH
    fi
  else
    if [ "$WEEK_NUM" == "class" ]
      then cd $BASE_PATH
    elif [ "$WEEK_NUM" == "curriculum" ]
      then cd $WDI_PATH/wdi-next/WDI_Curriculum
   else
      cd $BASE_PATH
    fi
  fi
}

## [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Defaults to tmux.

# WARNING: This might cause issues with RubyMotion iOS simulator

alias gettmux="vim ~/.tmux.conf"
alias settmux="tmux source-file ~/.tmux.conf"

#if [[ ! $TERM =~ screen ]]; then
#  tmux
#fi

# Python Stuff
# if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
#   export WORKON_HOME="$HOME/Dropbox/Code/Python/envs"
#   source /usr/local/bin/virtualenvwrapper.sh
# fi

# Global Go Code Path
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Dropbox/Code/Go
export PATH=$PATH:$GOPATH/bin

# SML/NJ PATH inclusion
export PATH=/usr/local/Cellar/smlnj/110.76/bin:$PATH

# Node.JS PATH inclusion
export NODE_PATH=/usr/local/lib/node
export PATH=/usr/local/share/npm/bin:$PATH

# Source NVM
if [ -e ~/.nvm/ ]; then
  . ~/.nvm/nvm.sh
fi

# RBENV stuff
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH=/usr/local/bin:/usr/local/mysql/lib:/Applications/Postgres93.app/Contents/MacOS/bin:/usr/local/mysql/bin:$PATH

# MySQL fix for python
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql/lib/ 

# Mopidy Python Fix
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH

### load environment vars
if [ -f ~/.env ]; then 
    source ~/.env
fi

if [ -f ~/.aws ]; then 
    source ~/.aws
fi

### Command Shortcuts
alias ll="ls -al"
alias cpdir="cp -R"

### get bash profile quickly
alias getbash="vim ~/.bash_profile"
alias setbash="source ~/.bash_profile"

### get env vars quickly
alias getenv="vim ~/.env"


### Launch Tiny Node Webserver
alias tnws="coffee /usr/local/bin/tnws.coffee"

#### Launch Tiny Python Server
alias pyserv="python -m SimpleHTTPServer"

### Folder Shortcuts
alias cdwdi5="cd /Users/omardelarosa/Dropbox/Code/WDI/wdi"
alias cdwdi7="cd /Users/omardelarosa/Dropbox/Code/WDI/wdi7"
alias cdwdi7work="cd /Users/omardelarosa/Dropbox/Code/WDI/wdi7/WDI_NYC_7_Work"
alias cdwdi7main="cd /Users/omardelarosa/Dropbox/Code/WDI/wdi7/WDI_NYC_7"
alias cdwdi7curriculum="cd /Users/omardelarosa/Dropbox/Code/WDI/wdi7/WDI_Curriculum"
alias cdwdidocs="cd /Users/omardelarosa/Dropbox/Docs/WDI"
alias cddrop="cd /Users/omardelarosa/Dropbox/"
alias cdruby="cd /Users/omardelarosa/Dropbox/Code/Ruby/"
alias cdscala="cd /Users/omardelarosa/Dropbox/Code/Scala/"
alias cdcode="cd /Users/omardelarosa/Dropbox/Code/"
alias cddl="cd /Users/omardelarosa/Downloads"
alias cdsites="cd /Users/omardelarosa/Sites"
alias cddesktop="cd /Users/omardelarosa/Desktop"

### RVM shortcuts
alias rvm193="rvm use ruby-1.9.3-p392"
alias rvm2="rvm use ruby-2.0.0-p247"

### Github shortcuts
alias gcheck="git checkout"
alias gadd="git add -A"
alias gstat="git status"
alias gcom="git commit -m"
alias gpom="git push origin master"

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
PS1="\e[34;40m\u\e[0m@\e[31;40m\h\e[0m:"

# Prompt 2: "path/to/where/you/are"
PS1="$PS1\e[32;40m\w\e[0m"

# Prompt 3: "(gitbranch)"
PS1="$PS1 \$([[ -n \$(git branch 2> /dev/null) ]] && echo \" \")\[\033[1;33m\]\$(parse_git_branch)\[\033[1;37m\]\n\$ \[$(tput sgr0)\]"

# PS1="$txtylw\w$txtgrn\$(branch)$txtwht ∴$txtrst "
##

#### General Assemb.ly/WDI Stuff

# A function that jumps to a particular wk/day folder in the class repo

function wdi() {
  local WEEK_NUM=$1
  local DAY_NUM=$2
  local BASE_PATH="/Users/omardelarosa/Dropbox/Code/WDI/wdi-lambda/WDI_NYC_Lambda"
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
    cd $BASE_PATH
  fi
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

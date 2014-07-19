### ENV Variables

### DB shortcuts
alias db_connect="psql -h $PGHOST -p $PG_PORT -U $PG_USER -W -d $PG_DB_NAME"

### Command Shortcuts
alias ll="ls -al"
alias cpdir="cp -R"

### get bash profile quickly
alias getbash="vim ~/.bash_profile"
alias setbash="source ~/.bash_profile"

### get env vars quickly
alias getenv="vim ~/.env"
alias setenv="source ~/.env"

### get nginx stuff quickly
alias getnginx="cd /etc/nginx/"
alias getnginxconf="sudo vim /etc/nginx/sites-enabled/default"
alias getnginxerrors="vim /var/log/nginx/error.log"
alias getnginxlogs="vim /var/log/nginx/access.log"

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
PS1="\[$(tput setaf 1)\]\e[\e[34;40m\u\e[m@\e[31;40m\h\e[m:\]"

# Prompt 2: "path/to/where/you/are"
PS1="$PS1\e[32;40m\w\e[m"

# Prompt 3: "gitbranch"
PS1="$PS1 \$([[ -n \$(git branch 2> /dev/null) ]] && echo \" \")\[\033[1;33m\]\$(parse_git_branch)\[\033[1;37m\]\n\$ \[$(tput sgr0)\]"


# Go Stuff
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# On-Source Tasks
setenv

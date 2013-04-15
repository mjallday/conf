# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

alias ll='ls -l'

function parse_git_branch {

  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'

}

function set_prompt() {
	# Color Code me Bro
	#NO_COLOR='\033[0m'
	#WHITE='\033[1;37m'
	#BLACK='\033[0;30m'
	#BLUE='\033[0;34m'
	#LIGHT_BLUE='\033[1;34m'
	#GREEN='\033[0;32m'
	#LIGHT_GREEN='\033[1;32m'
	#CYAN='\033[0;36m'
	#LIGHT_CYAN='\033[1;36m'
	#RED='\033[0;31m'
	#LIGHT_RED='033[1;31m'
	#PURPLE='\033[0;35m'
	#LIGHT_PURPLE='\033[1;35m'
	#YELLOW=\033[0;33m'
	#LIGHT_YELLO='\033[1;33m'
	#GRAY='\033[1;30m'
	#LIGHT_GRAY='\033[0;37m'
	RED='\[\033[31m\]'
	WHITE='\033[0m'

	# Get Virtual Env
	if [[ $VIRTUAL_ENV != "" ]]
	    then
	      # Strip out the path and just leave the env name
	      venv=" ${RED}(${VIRTUAL_ENV##*/})"
	else
	      # In case you don't have one activated
	      venv=''
	fi

    #export PS1="${myuser}${path}${venv}${branch} ${end}"

    export PS1="\[\e[1m\]________________________________________________________________________________\n\[\e[1;37;40m\]| \w @ \h ${venv}$WHITE$(parse_git_branch) \n| => \[\e[0m\]"
    export PS2="\[\e[1;30;47m\]| => \[\e[0m\]"
}

# prompt
export PROMPT_COMMAND=set_prompt

# python
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export PATH=$PATH:/usr/local/share/python
export VIRTUALENV_DISTRIBUTE=true
source /usr/local/share/python/virtualenvwrapper.sh

# node
export PATH=$PATH:/usr/local/share/npm/lib/node_modules/grunt-cli/bin

# ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# AWS
source ~/.aws_creds


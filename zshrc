# Path to your oh-my-zsh installation.
export ZSH=/Users/rodrigofigueroa1/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="dracula"

# disable flow control for C-s usage in vim
# https://stackoverflow.com/questions/23200753/disable-flow-control-in-bashrc-for-vim-mapping
stty -ixon -ixoff

# fixes double spaces in front of prompt in tmux
export LC_ALL=en_US.UTF-8 
export LANG=en_US.UTF-8

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textvim ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker z)

# https://robots.thoughtbot.com/cding-to-frequently-used-directories-in-zsh
setopt auto_cd
cdpath=($HOME/crazycake $HOME/dropbox/markdown)

# User configuration

# Paths

  # The USR_PATHS variable will just store all relevant /usr paths for easier usage
  # Each path is seperate via a : and we always use absolute paths.

  # A bit about the /usr directory
  # The /usr directory is a convention from linux that creates a common place to put
  # files and executables that the entire system needs access too. It tries to be user
  # independent, so whichever user is logged in should have permissions to the /usr directory.
  # We call that /usr/local. Within /usr/local, there is a bin directory for actually
  # storing the binaries (programs) that our system would want.
  # Also, Homebrew adopts this convetion so things installed via Homebrew
  # get symlinked into /usr/local
  # export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"

export PATH="/usr/local:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# adds woff2_compress
export PATH=$PATH:/usr/local/bin/woff2

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="vim ~/.oh-my-zsh"
#
# ++ LOCAL WORKSPACE DIRECTIVES ++
# set tab title to cwd
precmd () {
    tab_label=${PWD/${HOME}/\~} # use 'relative' path
    echo -ne "\e]2;${tab_label}\a" # set window title to full string
    echo -ne "\e]1;${tab_label: -24}\a" # set tab title to rightmost 24 characters
}

#Ruby rbenv (for ruby brew install)
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#Utils
export PATH=$HOME/workspace/utils:$PATH

#MySQL (optional)
export PATH=$HOME/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH

#Laravel (optional)
export PATH=$HOME/.composer/vendor/bin/:$PATH

#Node
# export PATH=/usr/local/lib/node_modules/:$PATH

#PhantonJS (optional)
export PATH=$HOME/workspace/phantomjs/lib/bin:$PATH

# crazy cake node
# export NODE_PATH=~/node_modules:$NODE_PATH

# Deploy SSH aliases

alias vi="vim"
alias vimrc="vim ~/.vimrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshrc_source='source ~/.zshrc'
alias zshrc='vim ~/.zshrc'

alias aws_crazycake='ssh -v -i $HOME/.ssh/CrazyCakeApps.pem ubuntu@54.85.185.121'
alias aws_liveon='ssh -v -i $HOME/.ssh/LiveOnApp.pem ubuntu@52.0.94.224'
alias aws_cineplanet='ssh -v -i $HOME/.ssh/CineplanetApp.pem ubuntu@54.152.250.221'
alias aws_burgerking='ssh -v -i $HOME/.ssh/BurgerKingApp.pem ubuntu@54.86.80.63'
alias aws_qwist='ssh -v -i $HOME/.ssh/QwistApp.pem ubuntu@54.175.218.212'
alias aws_comercialprima='ssh -v -i $HOME/.ssh/comercialprima.pem ubuntu@54.207.17.74'
alias hostmonster_pulido='ssh -v -i $HOME/.ssh/hostmonster_pulido.pub pulidocl@pulido.cl'

# Utils aliases

alias apache_restart='sudo apachectl -k restart'
alias apache_config='sudo vim /private/etc/apache2/extra/httpd-vhosts.conf'
alias php_config='sudo vim /usr/local/etc/php/5.6/php.ini'
alias redis_conf='sudo vim /usr/local/etc/redis.conf'
alias redis_start='redis-server &'
alias mysql_start='mysqld'
alias perms='stat -f %Mp%Lp $1'
alias bap='bash app.bash'
alias sync_time='ntpdate us.pool.ntp.org'
alias cellar='cd /usr/local/Cellar/'
alias clean_trash='sudo rm -rf ~/.Trash/*'
alias ping_server='sudo hping -S -p 80 $1'
alias curl_cors_test='curl -I -s -X GET -H "Origin: http://www.liveon.cl" http://d1uffgsmn0zbxz.cloudfront.net/frontend/fonts/opensans-light/opensans-light.woff2'

# Dev aliases

alias dev_webpack_symlink='ln -sf $HOME/workspace/cc-phalcon/webpacks/dist/js/webpack_core.bundle.js packages/webpacks/dist/js/webpack_core.bundle.js'
alias apache_global='sudo vim /private/etc/apache2/httpd.conf'

#fast copy
alias pwdc='pwd | pbcopy'

#Export NVM command
export NVM_DIR="/Users/rodrigofigueroa1/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias amend="git commit --amend"
alias -g G='| grep'
alias -g L='| less'
alias m='git checkout master'

alias be='bundle exec'
alias dv='./dev'
alias dev='./dev'
alias cli='./cli'

docker_clean() {
	docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
	#docker volume rm docker volume ls q -f dangling=true
}

#Select node Version
nvm use 8.6.0 

# loads rvm into a shell session
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 


eval "$(rbenv init -)"

# capitan logic
fpath=($HOME/.zsh/completion $fpath)
autoload -U compinit
compinit

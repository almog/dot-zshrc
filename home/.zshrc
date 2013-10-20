# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler)

source $ZSH/oh-my-zsh.sh
source ~/.git-flow-completion.zsh
# Customize to your needs...
export PATH=:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/usr/local/sbin:/Users/almog/proj/otp/install/R14B03/bin:/Users/almog/bin:/usr/local/share/npm/bin

#VIM
##Sets the vim runtime
#export VIM=/usr/local/Cellar/vim/7.3.672/share/vim/vim73
##brew vim path
#export PATH=:/usr/local/Cellar/vim/7.3.672/bin:$PATH
alias vi=vim

export GOROOT=$HOME/proj/go
export PATH=$PATH:$GOROOT/bin

export PGDATA=/usr/local/var/postgres

#VI mode
bindkey -v
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char 
bindkey '^N' history-beginning-search-backward
#bindkey -M viins '^U' kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

#Unlimited history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000

alias gff='git flow feature'

GREP_OPTIONS=--color=auto\ --exclude=\"*.log\"
alias git="nocorrect git"

decode(){echo "require 'uri'; puts URI.decode('$1').gsub('+', ' ')" | ruby }
encode(){echo "require 'uri'; puts URI.escape('$1').gsub('+', ' ')" | ruby }


DISABLE_AUTO_TITLE=true

export EDITOR=vim
alias zconf="vim ~/.zshrc"
alias vconf="vim ~/.vimrc"
alias zload="source ~/.zshrc"

alias ssh-copy="pbcopy <~/.ssh/id_rsa.pub"

function server() {
local port="${1:-8000}"
open "http://localhost:${port}/"
python -m SimpleHTTPServer "$port"
}

function ydl() {
  youtube-dl -o "%(stitle)s.mp4" $1
}

function ydl-mp3() {
  youtube-dl -o "%(title)s.%(ext)s" --extract-audio --audio-format=mp3 $1
}
mcd(){mkdir -p "$1" && cd "$1"} # create and change to a new directory

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
#for kred
export CRACKLIB_DICTPATH=/usr/local/Cellar/cracklib-words/20080507/share:/usr/local/Cellar/cracklib-words/20080507:/usr/local/Cellar/cracklib-words

source '/usr/local/share/chruby/chruby.sh'
source '/usr/local/share/chruby/auto.sh'
chruby 1.9.3-p448


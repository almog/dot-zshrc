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
# Customize to your needs...
export PATH=:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/usr/local/sbin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH" # gnu core utils
export PATH=$PATH:/Applications/calibre.app/Contents/console.app/Contents/MacOS
export PATH=$PATH:/Users/almogkurtser/bin

#VIM
alias vi=vim
alias ltr="ls -ltr"


export PGDATA=/usr/local/var/postgres

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
#zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}' # https://stackoverflow.com/a/14350512/103088
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' # https://www.reddit.com/r/zsh/comments/4aq8ja/is_it_possible_to_enable_smartcase_tab_completion/

#VI mode
bindkey -v
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char 

# Regular expression reverse search (for regular search use history-incremental-search-backward)
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^N' history-beginning-search-backward
#bindkey -M viins '^U' kill-line
bindkey "^S" history-incremental-search-forward

#Unlimited history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

unsetopt HIST_VERIFY #Execute all expansions on ENTER

alias depry='sed -i "/binding.pry/d" ./**/*.rb'

GREP_OPTIONS=--color=auto\ --exclude=\"*.log\"
alias git="nocorrect git"

#Decode a URI (like JS decodeURIComponent)
decode(){echo "require 'uri'; puts URI.decode('$1').gsub('+', ' ')" | ruby }
#Encode a URI (like JS encodeURIComponent)
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
  youtube-dl -o "%(stitle)s.mp4" $@
}

function ydl-mp3() {
  youtube-dl -o "%(title)s.%(ext)s" --extract-audio --audio-format=mp3 $1
}

function power_outage_check() {
   curl 'https://www.iec.co.il/pages/IecServicesHandler.ashx?a=CheckInterruptByAddress&cityID=25&streetID=13781&homeNum=45&Districtid=802&FullAddres=%D7%94%D7%A2%D7%A6%D7%9E%D7%90%D7%95%D7%AA+45%2C+%D7%90%D7%91%D7%9F+%D7%99%D7%94%D7%95%D7%93%D7%94&guid=1652787602833' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 11.0; rv:99.0) Gecko/20100101 Firefox/100.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' -H 'Referer: https://www.iec.co.il/pages/electricityfaults.aspx' -H 'Sec-Fetch-Dest: empty' -H 'Sec-Fetch-Mode: cors' -H 'Sec-Fetch-Site: same-origin' -H 'DNT: 1' -H 'Sec-GPC: 1' -H 'TE: trailers' | jq '.IncidentStatusName'
}

mcd(){mkdir -p "$1" && cd "$1"} # create and change to a new directory

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NODE_PATH="$(npm config --global get prefix)/lib/node_modules"

source '/usr/local/share/chruby/chruby.sh'
source '/usr/local/share/chruby/auto.sh'

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

export PYTHONDONTWRITEBYTECODE=1 # disable bytecode (.pyc) everywhere
export PYTHONSTARTUP=~/.pythonrc 

cd ~/proj
export PATH=/Users/almogkurtser/proj/SingleFile/cli:$PATH

. /usr/local/opt/asdf/asdf.sh

# Created by `pipx` on 2021-05-15 14:13:56
export PATH="$PATH:/Users/almogkurtser/.local/bin"

# Install a package without updating everything
export HOMEBREW_NO_AUTO_UPDAT=1

PYENV_ROOT=$(pyenv root)
export PATH="$HOME/.pyenv/bin:$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

#export ANDROID_SDK_ROOT="$HOME/bin/android_sdk"
#export PATH="$PATH:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/tools/lib:$ANDROID_SDK_ROOT/platform-tools"

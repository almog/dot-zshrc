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
export PATH=$PATH:/Users/almog/proj/otp/install/R14B03/bin:/Users/almog/bin:/usr/local/share/npm/bin:/usr/local/texlive/2015/bin/x86_64-darwin/
export PATH=$PATH:/Applications/calibre.app/Contents/console.app/Contents/MacOS
#VIM
alias vi=vim
alias ltr="ls -ltr"


export PGDATA=/usr/local/var/postgres

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

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
  youtube-dl -o "%(stitle)s.mp4" $1
}

function ydl-mp3() {
  youtube-dl -o "%(title)s.%(ext)s" --extract-audio --audio-format=mp3 $1
}

mcd(){mkdir -p "$1" && cd "$1"} # create and change to a new directory

function gen_phone() {
  curl -s 'https://www.youphone.co.il/inc/Handlers/SMSHandler.ashx?type=1' |
  jq '.Data' |
  sed -E 's/([0-9])/\1-/3'
}

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91"

# begin git brownbag helper commands
alias find_objs='find .git/objects -type f | xargs ls -ltr'
alias zlib_decompress="/usr/local/Cellar/openssl/1.0.2k/bin/openssl zlib -d -in"
export poem="Writing A Curriculum Vita - Wislawa Szymborska \n\nWhat must you do?\nYou must submit an application\nand enclose a Curriculum Vitae.\n\nRegardless of how long your life is,\nthe Curriculum Vitae should be short.\n\nBe concise, select facts.\nChange landscapes into addresses\nand vague memories into fixed dates.\n\nOf all your loves, mention only the marital,\nand of the children, only those who were born.\n\nIt's more important who knows you\nthan whom you know.\nTravels - only if abroad.\nAffiliations––to what, not why.\nAwards - but not for what.\n\nWrite as if you never talked with yourself,\nas if you looked at yourself from afar.\n\nOmit dogs, cats, and birds,\nmementos, friends, dreams.\n\nState price rather than value,\ntitle rather than content.\nShoe size, not where one is going,\nthe one you are supposed to be.\n\nEnclose a photo with one ear showing.\nWhat counts is its shape, not what it hears.\n\nWhat does it hear?\nThe clatter of machinery that shreds paper.\n"

# end git brownbag helper commands
function sshfix() { eval `ssh-agent -s` && ssh-add -K ~/.ssh/id_rsa }
function delete_merged(){ git branch --merged | egrep -v "(^\*|master|dev)"  | xargs git branch -d }
sshfix

fortune  | cowsay | lolcat

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NODE_PATH="$(npm config --global get prefix)/lib/node_modules"

source '/usr/local/share/chruby/chruby.sh'
source '/usr/local/share/chruby/auto.sh'

chruby 2.6.1

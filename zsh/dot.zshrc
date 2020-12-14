# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
##ZSH_THEME="afowler"
#ZSH_THEME="sunaku"
#ZSH_THEME="mh"
#ZSH_THEME="terminalparty"
ZSH_THEME="dracula"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  go
  bundler
  dotenv
  osx
  rake
  rbenv
  ruby
  aws
  batery
  docker
  github
  iterm2
  pip
  #pyenv
  pylint
  python
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

setopt auto_pushd
setopt pushd_ignore_dups

autoload -U select-word-style
select-word-style bash

bindkey "^f" emacs-forward-word
bindkey "^b" emacs-backward-word
bindkey "^w" backward-delete-word

#PROMPT='[%{$fg[$NCOLOR]%}%B%n%b%{$reset_color%}:%{$fg[red]%}%30<...<%~%<<%{$reset_color%}]%(?..%{[01;31m%}(%?%)%{[22;39m%} )%(!.#.$) '
#PROMPT='%{]0;%n@%m%}'"$PROMPT"

#PROMPT='%{[01;31m%}[%D{%H:%M}]%{[22;39m%} %m%{[01;37m%}:%{[22;39m%}%{[33m%}%35<...<%{[39m%}%~ %(?..%{[01;31m%}(%?%)%{[22;39m%} )%(2L.%{[01;33m%}.%{[01;37m%})%(!.#.$)%{[22;39m%} '
#if [[ $TERM = rxvt || $TERM = *xterm* || $TERM = aterm || $TERM = Eterm ]]; then
#	PROMPT='%{]0;%n@%m%}'"$PROMPT"
#else
#fi

zmodload -i zsh/complist

# Je¶li wiêcej ni¿ 4 elementy, to rozwijaæ menu.
zstyle ':completion:*' menu select=4

autoload -U compinit
compinit

# Kolorowa lista.
zstyle ':completion:*' list-colors ''

## vcs_info stuff
#setopt prompt_subst
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' actionformats \
#    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
#zstyle ':vcs_info:*' formats       \
#    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
#
#zstyle ':vcs_info:*' enable git cvs svn
#
## or use pre_cmd, see man zshcontrib
#vcs_info_wrapper() {
#  vcs_info
#  if [ -n "$vcs_info_msg_0_" ]; then
#    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
#  fi
#}
#RPROMPT=$'$(vcs_info_wrapper)'

if [[ $OSTYPE = freebsd* ]]; then
	alias ls="ls -GF"
	alias ll="ls -laGF"
	alias lsmod="kldstat"
	llast() { if [ -n "$1" ]; then for i in ~log/wtmp ~log/archive/wtmp*; do last -f $i $1; done; fi }
	hash -d rcd="/usr/local/etc/rc.d"
	hash -d letc="/usr/local/etc"

elif [[ $OSTYPE = darwin* ]]; then
    alias ll="ls -laGF"

elif [[ $OSTYPE = linux* ]]; then
	alias ls="ls -F --color=auto"
	alias ll="ls -laF --color=auto"
	alias kldstat="lsmod"
fi

alias ssh="ssh -X -o'Protocol 2,1'"

HISTFILE=${HOME}/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_no_store
setopt inc_append_history
setopt extended_history
setopt hist_reduce_blanks

# Usuwanie niepotrzebnych slashy i innych takich.
setopt auto_remove_slash

# completion "w ¶rodku" wyrazu
setopt complete_in_word

# zaawansowane globy
setopt extendedglob

REPORTTIME=10

#zstyle ':completion:*:processes' command 'ps -aux'

export EDITOR='vim'
export GIT_AUTHOR_EMAIL=dom@scalefactory.com
export GIT_AUTHOR_NAME='Dominik Zyla'
export GIT_COMMITTER_EMAIL=dom@scalefactory.com
export GIT_COMMITTER_NAME='Dominik Zyla'
export LD_LIBRARY_PATH=~/luit/lib
LSCOLORS="ExGxFxdxCxDxDxhbadExEx"
export LSCOLORS

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export PYTHONSTARTUP=~/.pythonrc
export GOPATH=$HOME/src/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin/go

alias tmux="TERM=screen-256color-bce tmux"

#zstyle ':completion:*' max-errors 1
#zstyle ':completion:*' original true
#zstyle ':completion:*' completer _complete _correct _approximate

if [ -r ${HOME}/.zshrc_local ]; then
	. ${HOME}/.zshrc_local
else
    echo "OMG"
fi



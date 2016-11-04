#Personal aliases for the shell

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
if ls --color &>/dev/null; then
        export LS_COLORS="di=01;33"
        ls_opt="--color" #Linux ls colors
else
        export LSCOLORS=dxfxcxdxbxegedabagacad
        ls_opt="-G" #Mac OSX ls colors
fi
alias ls='ls $ls_opt'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Ensure less interprets color codes

alias less='less -r'

# GVim Alias 160x48 geometry, for Linux
alias gvim='gvim -geometry 160x48'

# Ctags a Rails project
alias tag_rails='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'

# Alias HUB as git if hub is installed
# Find HUB at http://defunkt.io/hub/
#if which hub >/dev/null; then
#  alias git='hub'
#fi

# Git shortcuts
alias gs='git status; git submodule status'
alias ga='git add'
# alias gc='git commit -m'    (See function below)
alias gull='git pull'
alias gush='git push'
alias gsh='git show'
alias gl="git log --pretty='format:%C(white)%h%Creset - %C(green)%an%Creset, %C(yellow)%ar%Creset : %C(cyan)%s%Creset'"
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gu='git pull --rebase origin `git symbolic-ref --short -q HEAD`; git fetch origin -p'

# Usage:
#   gc 'bug is fixed'                 # non-interactive mode
#   gc                                # interactive mode
#   Commit message: bug is fixed
#
function gc {
  local commitmessage
  if [ "" = "$1" ]; then
    echo -n 'Commit message: '
    commitmessage="$(ruby -e "puts gets")"
    git commit -m "$commitmessage"
  else
    git commit -m "$1"
  fi
}


## Iberon stuff
alias nciteprep='bundle && bundle exec rake example_files:apply:all && bundle exec phil-columns reset schema && bundle exec phil-columns mulligan; bundle exec rake db:test:prepare'

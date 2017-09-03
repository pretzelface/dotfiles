#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -G'

# Show git branch name and bash prompt
# bold for dirty branches
c_sgr0="$(tput sgr0)"
c_clean=$c_sgr0
c_dirty="$(tput bold)"
parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
          gitver="["$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')"]"
  else
          return 0
  fi
  echo -e $gitver
}
branch_color ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
    color=""
    if git diff --quiet 2>/dev/null >&2
    then
      color="${c_clean}"
    else
      color=${c_dirty}
    fi
  else
    return 0
  fi
  echo -ne $color
}

PS1='\u@\h \w \[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]$ '
PATH=$PATH:./node_modules/*

alias gco='git checkout'
alias gst='git status'
alias gbr='git branch'
alias grm='git rebase -i origin/master'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gaa='git add -A'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias yqal='yarn run quality'

source /usr/local/opt/chruby/share/chruby/chruby.sh

set -o vi

export NPM_TOKEN=fbfa3e61-7ccf-4df8-ba0a-d27d0586119e

runSpec () {
  echo "running spec $1"
  SPEC=$1 yarn run test:server
}

alias yspec=runSpec


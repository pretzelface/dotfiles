#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -G'
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

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
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_NDK=~/Library/Android/ndk
export SPAMFIRE=true
alias adbreverse='adb reverse tcp:8081 tcp:8081'
alias befs='bundle exec foreman start'
alias befsi='bundle exec foreman start init'
alias gco='git checkout'
alias glo='git log --online master..HEAD'
alias gst='git status'
alias gbr='git branch'
alias grm='git rebase -i origin/master'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gaa='git add -A'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

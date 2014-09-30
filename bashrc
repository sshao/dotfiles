################################################################################
# git branch in prompt
#
# Quick fork by @mcjim to add stash status and tweak to suit his style.
# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   host dir master $   # clean working directory
#   host dir master* $  # dirty working directory
#   host dir master*^ $  # dirty working directory with stash
#   host dir master^ $  # clean working directory with stash
################################################################################
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_stash {
  [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo "^"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)$(parse_git_stash)/"
}
PS1='\[\e[0;33m\]${HOSTNAME}\[\e[m\] \W \[\e[0;31m\]$(parse_git_branch)\[\e[m\] $ '

################################################################################
# exports
################################################################################
export EDITOR=vim

################################################################################
# aliases
################################################################################
alias be="bundle exec "
alias reload="source ~/.bashrc"

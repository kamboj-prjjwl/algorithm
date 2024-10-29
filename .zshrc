alias del_nr="git branch -D network-release-1"
alias go_main="git checkout main"
alias pull_main="git pull origin main"
alias push_main="git push origin main"
alias push_nr="git push origin network-release-1"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi

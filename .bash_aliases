alias c=clear
alias ..="cd .."
alias ...="cd ../.."
alias x="extract"
alias server="ruby -run -ehttpd . -p8000"
alias icat="kitty +kitten icat"
alias http="sudo docker run -ti --rm vedranvinko/httpie"
alias tl="tldr --list | fzf --preview 'tldr {} --color always' | xargs tldr"
alias pls='sudo $(fc -ln -1)'
alias gg='/usr/games/fortune -n 1 | /usr/games/cowsay -n | lolcat'
alias gob='cd -'
alias igob='cd - > /dev/null; echo -e "You were in: $OLDPWD\nNow you are in: $PWD"'
alias xo='xdg-open .'
alias stripcomments='grep -v ^$ | grep -v ^#'
alias sc=stripcomments
alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

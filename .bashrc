PS1="\[\033[36;1m\]\w\[\033[m\]\$ "
alias ls="ls -G"

function cdls() {
    \cd $1;
    ls;
}

alias cd="cdls" 

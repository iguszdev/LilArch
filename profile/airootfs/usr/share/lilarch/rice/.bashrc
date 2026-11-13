PS1='\[\e[1;96m\]lil\[\e[1;95m\]arch\[\e[0m\] \w 🍭 '
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias update='sudo pacman -Syu'
alias ..='cd ..'
[[ $- == *i* && -z $LILFETCH && $(tty) == /dev/tty1 ]] && export LILFETCH=1 && fastfetch

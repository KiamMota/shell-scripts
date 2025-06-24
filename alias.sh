
# this barline is only available with jetbrains mono font

PS1='\[\e[1;30;47m\][\t]\[\e[0m\]  \[\e[1m\]\u \w:\[\e[0m\] '

alias ..='cd ..'
alias bashup='source ~/.bashrc'
alias hmm='echo whaaa?'

gad() { git add . && git commit -m "$*"; }

alias g='git'
alias pull='git pull'
alias push='git push'
alias add='git add'
alias com='git commit -m'
alias q='exit'
alias suin='sudo apt install'
alias sup='sudo apt update'
alias supg='sudo apt upgrade'
alias c='clear'
alias cls='clear'
alias docs='cd ~/Documentos'
alias docs='cd ~/Documents'

alias nnbashrc='nano ~/.bashrc'
alias hxbash='hx ~/.bashrc'

alias in='cd'
alias ytmp3='yt-dlp -x --audio-format mp3'
alias ytmp3as='yt-dlp -x --audio-format mp3 -o'
alias yt='yt-dlp'
alias dw='cd Downloads'
alias shut='sudo shutdown now'

ren() {
  if [[ $# -ne 2 ]]; then
    echo "Uso: ren <arquivo_antigo> <arquivo_novo>"
    return 1
  fi
  mv "$1" "$2"
}

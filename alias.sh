PS1='\[\e[1;30;47m\][\t]\[\e[0m\] \[\e[1m\] \u@\h:\[\e[0m\]'

alias ..='cd ..'
alias bashup='source ~/.bashrc'
alias hmm='echo whaaa?'

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
alias bashrc='hx ~/.bashrc'
alias in='cd'
alias ytmp3='yt-dlp -x --audio-format mp3'
alias ytmp3as='yt-dlp -x --audio-format mp3 -o'
alias yt='yt-dlp'
alias dw='cd Downloads'
alias shut='sudo shutdown now'

rename() {
  local old="$1"
  local new="$2"
	  if [[ -z "$old" || -z "$new" ]]; then
	    echo "Uso: rename -> new"
    return 1
  fi
  mv "$old" "$new"
}
Add comment

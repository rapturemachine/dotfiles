# alias definitions can be edited/modified with 'aedit'

export EDITOR="vim"
alias vi="vim"
alias aedit=" $EDITOR $ZSH_CONFIG/aliases.zsh; source $ZSH_CONFIG/aliases.zsh"
alias zedit=" $EDITOR $ZSH_CONFIG/.zshrc; source $ZSH_CONFIG/.zshrc"
alias viedit=" $EDITOR $HOME/.vim/vimrc"

alias ls='ls -F --color=always'
alias p='custom_ps_aux'
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..;'
alias grep='grep --color'
alias startx='startx ~/.xinitrc'
alias xrandr-mon='xrandr --output DVI-D-0 --mode 1280x800 && xrandr --output DVI-D-0 --mode 1920x1080'
alias xrandr-tv='xrandr --output DVI-D-0 --mode 1360x768'

eval "$(thefuck --alias fuck)"

custom_ps_aux() {
    ps aux | grep -v grep | grep --color "$1"
}

# shell options such as history size, keybindings, tab completion, etc.
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}"   backward-delete-char
[[ -n ${key[Insert]}    ]] && bindkey "${key[Insert]}"      overwrite-mode
[[ -n ${key[Home]}      ]] && bindkey "${key[Home]}"        beginning-of-line
[[ -n ${key[PageUp]}    ]] && bindkey "${key[PageUp]}"      up-line-or-history
[[ -n ${key[Delete]}    ]] && bindkey "${key[Delete]}"      delete-char
[[ -n ${key[End]}       ]] && bindkey "${key[End]}"         end-of-line
[[ -n ${key[PageDown]}  ]] && bindkey "${key[PageDown]}"    down-line-or-history
[[ -n ${key[Up]}        ]] && bindkey "${key[Up]}"          up-line-or-search
[[ -n ${key[Left]}      ]] && bindkey "${key[Left]}"        backward-char
[[ -n ${key[Down]}      ]] && bindkey "${key[Down]}"        down-line-or-search
[[ -n ${key[Right]}     ]] && bindkey "${key[Right]}"       forward-char


ZSH_CACHE=$HOME/.config/zsh

# different history files for root and standard user
if (( ! EUID )) {
    HISTFILE=$ZSH_CACHE/history_root
} else {
    HISTFILE=$ZSH_CACHE/history
}

SAVEHIST=10000
HISTSIZE=12000

# share history between zsh sessions; append commands to the history file
setopt share_history

# save each command's timestamp
setopt extended_history

# do not store the 'history' command in history
setopt hist_no_store

# ignore history duplicates
setopt hist_ignore_all_dups

# do not enter commands into the history if they begin with a space
setopt hist_ignore_space

# if a command is issued that can’t be executed as a normal command, and the command 
# is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD

# treat  the '#', '~' and '^' characters as part of patterns for filename generation, etc.
# (an initial unquoted '~' always produces named directory expansion)
setopt EXTENDED_GLOB

# if a pattern for filename generation has no matches, print an error, instead of leaving it
# unchanged in the argument  list; this also applies to file expansion of an initial '~' or '='
setopt NOMATCH

# no beep on error in zle
setopt NO_BEEP

# do not allow '>' to overwrite existing files; if you do want to overwrite, use '>!'
# also works with '!!'
setopt NO_CLOBBER

# enable tab autocompletion
autoload -U compinit && compinit

# enable graphical tab completion menu
zstyle ':completion:*' menu select

# case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# in tab completion, the first possible match is inserted automatically
setopt menu_complete

# complete with colors
zstyle ':completion:*' list-colors ""


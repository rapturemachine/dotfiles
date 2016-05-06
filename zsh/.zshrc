# first include of the environment
source $HOME/.config/zsh/environment.zsh

ZSH_CONFIG=$HOME/.config/zsh
setopt share_history

typeset -ga sources
sources+="$ZSH_CONFIG/environment.zsh"
sources+="$ZSH_CONFIG/options.zsh"
sources+="$ZSH_CONFIG/prompt.zsh"
sources+="$ZSH_CONFIG/aliases.zsh"

# try to include all sources
foreach file (`echo $sources`)
    if [[ -a $file ]] {
        source $file
    }
end


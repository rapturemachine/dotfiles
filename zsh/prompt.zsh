autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -Uz vcs_info
NEWLINE=$'\n'

zstyle ':vcs_info:*' enable git
precmd() {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*'    formats "%B%F{green}%%n@%%m %F{blue}%~ $ %%f%%b" "%F{green}%m%u%c %f%b:%r/%S"
    } else {
        zstyle ':vcs_info:*'    formats "%B%F{green}%%n@%%m %F{blue}%~ $ %%f%%b" "%F{green}%m%u%c%F{red}● %f%b:%r/%S"
    }    

    vcs_info
}

setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*'    stagedstr '%F{green}●%f'
zstyle ':vcs_info:*'    unstagedstr '%F{blue}●%f'
zstyle ':vcs_info:*'    nvcsformats "%B%F{green}%n@%m %B%F{blue}%~ $ %b%f"
zstyle ':vcs_info:*'    actionformats '%F{magenta}(%f%s%F{magenta})%f%F{yellow}-%f%F{magenta}[%f%F{green}%b%f%F{yellow}|%f%F{red}%a%f%F{magenta}]%f'
 
PROMPT='${vcs_info_msg_0_}'
RPROMPT='${vcs_info_msg_1_}'

#function precmd() {
#	print stuff & it'll show up before the prompt
#} 

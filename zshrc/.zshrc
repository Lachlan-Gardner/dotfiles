zmodload zsh/complist
autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz vcs_info

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000

# completion stuff
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes false
zstyle ':completion:' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=' 'l:|= r:|='

setopt append_history inc_append_history # better history
setopt auto_menu menu_complete # autocmp first menu match
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# source <(fzf --zsh)

bindkey -e

# prompt & open message 
NEWLINE=$'\n'
ESC=$'\x1b'

setopt PROMPT_SUBST
PROMPT='%m%F{magenta}:%f '


autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

export ELECTRON_OZONE_PLATFORM_HINT=wayland

export SUDO_PROMPT="Enter your credit card details: "

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# For cross compiling bootable programs.
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

export PATH="$HOME/.config/emacs/bin:$PATH"

export PATH="$HOME/.qlot/bin:$PATH"

alias nvim='f() { umbriel msg window-toggle-maximize && command nvim $1; umbriel msg window-toggle-maximize };f'

# terminal-wakatime setup
export PATH="$HOME/.wakatime:$PATH"
eval "$(terminal-wakatime init)"

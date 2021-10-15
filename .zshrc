source ~/.zplug/init.zsh

# pywal retrieve terminal colors
cat ~/.cache/wal/sequences

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# History and cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.cache/zsh/history
setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS

# Basic auto/tab complete:
#autoload -U compinit && compinit -u
#zstyle ':completion:*' menu select
# Auto complete with case insenstivity
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#zmodload zsh/complist
#compinit
#_comp_options+=(globdots)		# Include hidden files.

# zplug modules
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "marlonrichert/zsh-autocomplete"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# echo "Loading [zplug] modules..."
zplug load

# spaceship options
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_VI_MODE_SHOW=true
SPACESHIP_VI_MODE_PREFIX=""
eval spaceship_vi_mode_disable

# zsh-autocomplete configs
zstyle ':autocomplete:*' min-delay 0.3
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-select

# aliases
alias ll='exa -lah'
alias lh='exa -lh'
alias ls='exa'
alias l='exa'
alias grep='grep --color=auto'
alias nano='nvim'
alias vi='nvim'
alias vim='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ua-drop-caches='sudo paccache -rk3; yay -Sc --aur --noconfirm'
alias ua-update-all='export TMPFILE="$(mktemp)"; \
	sudo true; \
	rate-mirrors --save=$TMPFILE --entry-country=ES arch --max-delay=21600 \
	  && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
	  && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
	  && ua-drop-caches \
	  && yay -Syyu --noconfirm'

alias ua-rate-mirrors='export TMPFILE="$(mktemp)"; \
	sudo true; \
	rate-mirrors --save=$TMPFILE --entry-country=ES arch --max-delay=21600 \
	  && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
	  && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
	  && sudo mv $TMPFILE /etc/pacman.d/mirrorlist' 

# zsh keybinds
autoload zkbd
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word


# zsh vi mode and intelligent history search
#bindkey -v
#export KEYTIMEOUT=1
#autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#bindkey -M vicmd k up-line-or-beginning-search
#bindkey -M vicmd j down-line-or-beginning-search

# nvm stuff
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# gnupg
export GPG_TTY=$TTY

# ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

function gam2() { "/home/marcos/bin/gam/gam" "$@" ; }

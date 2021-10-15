export EDITOR="nvim"
export BROWSER="brave"
export XDG_CONFIG_HOME="/home/marcos/.config"
export XDG_CONFIG_DIR="/home/marcos/.config"
export XDG_CACHE_DIR="/home/marcos/.cache"
export QT_QPA_PLATFORMTHEME=qt5ct
export PATH=$PATH:$HOME/.scripts
export NVM_DIR="$HOME/.config/nvm"
export SAL_USE_VCLPLUGIN=kf5


# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


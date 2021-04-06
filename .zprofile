if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep bspwm || startx
fi

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# this sometimes doesn't work without setting it here for some reason
LANG=en_US.UTF-8
export LANG

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi

#!/bin/bash

echo "hey there" >> /tmp/debug.txt

# Get the current window
PID=$(xdotool getwindowpid $(bspc query -N -n focused))
Process=$(ps -p $PID -o comm=)

if [[ "$Process" == "firefox" ]]; then

	# Get the window ID of the Firefox window
	firefox_window_id=$(xdotool search --class "Firefox")

	# Activate the Firefox window
	xdotool windowactivate --sync "$firefox_window_id"
	
	# Simulate a key press to switch tabs (Ctrl+Tab for next tab, Ctrl+Shift+Tab for previous tab)
	if [[ "$1" == "right" ]]; then
		xdotool key --clearmodifiers --window "$firefox_window_id" "ctrl+Tab"
	elif [[ "$1" == "left" ]]; then
		xdotool key --clearmodifiers --window "$firefox_window_id" "ctrl+shift+Tab"
	fi

	echo "it's $1" >> /tmp/debug.txt
fi
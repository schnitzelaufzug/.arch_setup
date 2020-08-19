#!/bin/bash
# Idea: Make mode also a variable

string="--same-as"
[ "$1" = "left" ] && string="--left-of"
[ "$1" = "right" ] && string="--right-of"

# Get list of connected monitores
monitor=$(xrandr | grep -w 'connected' | cut -d ' ' -f1 | sed -n 2p)

# Set Monitor to left or right side
xrandr --auto --output $monitor --mode 1920x1080 $string eDP1

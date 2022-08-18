#!/bin/bash

# [usage examples]

# sh ./floating.sh kitty -e "htop"
# sh ./floating.sh kitty -e "ranger"

$@ &
swaymsg "for_window [pid=\"$!\"] floating enable"
swaymsg "for_window [pid=\"$!\"] resize set 1500 800"

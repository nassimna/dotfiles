#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}


#change your keyboard if you need it
#setxkbmap -layout be

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

if [ $keybLayout = "fr" ]; then
  run sxhkd -c ~/.config/sxhkd/sxhkdrc &
else
  run sxhkd -c ~/.config/sxhkd/sxhkdrc-qwerty &
fi

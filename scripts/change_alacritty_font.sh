#!/bin/bash

if [[ "$1" == "Cascadia" ]]; then
    cp ~/.config/alacritty/alacritty_cascadia.yml ~/.config/alacritty/alacritty.yml
elif [[ "$1" == "JetBrains" ]]; then
    cp ~/.config/alacritty/alacritty_jetbrains.yml ~/.config/alacritty/alacritty.yml
fi


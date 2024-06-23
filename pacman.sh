#!/bin/bash

packages=(
    dotter-rs-bin # config manager
    hyprcursor # cursor theme configuration
    phinger-cursors # cursor theme
    hyprland # hyprland :)
    hyprpaper # for background image control
    adwaita-icon-theme # icon theme for yofi
    xdg-desktop-portal-hyprland # portal for screen capture
    ttf-jetbrains-mono # jetbrains font
    noto-fonts-emoji # emoji
    fish # shell
    fisher # plugin manager for fish
    wezterm-git # terminal
    zoxide # smart cd command
    fzf # fuzzy finder
    fd # alternative to find
    lsd # alternative to ls
    bat # alternative to cat
    ripgrep # alternative to grep
)

# Not full list
paru -Sy --needed "${packages[@]}"
    

#!/usr/bin/env bash
# [ ! -d "$HOME/.cache/wal" ] && ln -s $PWD/cache ~/.cache/
[ ! -d "$HOME/.cache/wal" ] && cp $PWD/cache ~/.cache/
[ ! -d "$HOME/.config/" ] && ln -s $PWD/config ~/.config
[ ! -d "$HOME/Pictures" ] && ln -s $PWD/Pictures ~/Pictures
[ ! -d "$HOME/.bin" ] && ln -s $PWD/bin ~/.bin
[ ! -d "/etc/lib/udev" ] && sudo ln -s $PWD/lib /etc/
 sudo nixos-rebuild switch --flake .#epicOs

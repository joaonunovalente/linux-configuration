#!/usr/bin/env bash

echo "Installing Gogh themes..."

curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v1.0.0/install.py | python3 -

bash -c "$(wget -qO- https://git.io/vQgMr)" -- "Nanosecond"

echo "Done."

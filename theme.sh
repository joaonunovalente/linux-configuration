#!/bin/bash

REPO="https://github.com/vinceliuice/Orchis-theme.git"
DIR="$HOME/Orchis-theme"

if [ -d "$DIR" ]; then
    echo "Orchis já existe. A atualizar..."
    cd "$DIR" || exit
    git pull
else
    echo "A clonar repositório Orchis..."
    git clone "$REPO" "$DIR"
    cd "$DIR" || exit
fi

echo "A instalar/atualizar Orchis theme..."
./install.sh -c

gsettings set org.cinnamon.desktop.interface gtk-theme "Orchis-Light"
gsettings set org.cinnamon.desktop.wm.preferences theme "Orchis-Light"
gsettings set org.cinnamon.theme name "Orchis-Light"


echo "Concluído!"

#!/bin/bash

echo "Atualizando sistema..."
sudo apt update
sudo apt install -y flatpak git pcscd curl nano

echo "Adicionando Flathub (sistema)..."
sudo flatpak remote-add --if-not-exists flathub \
    https://flathub.org/repo/flathub.flatpakrepo

APPS=(
    com.brave.Browser
    org.chromium.Chromium
    org.mozilla.firefox
    com.google.Chrome
    com.bitwarden.desktop
    com.yubico.yubioath
    org.onlyoffice.desktopeditors
    it.mijorus.gearlever
    com.github.jeromerobert.pdfarranger
    com.github.tchx84.Flatseal
    org.fedoraproject.MediaWriter
    com.stremio.Stremio
    com.valvesoftware.Steam
    com.mattjakeman.ExtensionManager
    org.gnome.font-viewer
    org.supertuxproject.SuperTux
)

echo "Instalando aplicativos Flatpak..."
sudo flatpak install -y flathub "${APPS[@]}"

echo "Ativando serviço PC/SC..."
sudo systemctl enable --now pcscd

echo "Instalação concluída!"
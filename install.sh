#!/bin/bash
echo "Atualizando sistema..."
sudo apt update
sudo apt install -y flatpak

echo "Adicionando Flathub (sistema)..."
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

APPS=(
    com.brave.Browser
    com.bitwarden.desktop
    com.yubico.yubioath
    org.chromium.Chromium
    com.google.Chrome
    org.onlyoffice.desktopeditors
    it.mijorus.gearlever
    com.github.jeromerobert.pdfarranger
    com.github.tchx84.Flatseal
    org.fedoraproject.MediaWriter
    com.stremio.Stremio
)

for APP in "${APPS[@]}"
do
    echo "Instalando $APP ..."
    sudo flatpak install -y flathub $APP
done

echo "Instalando IdGov..."
sudo flatpak install -y ./autenticacao-gov.flatpak

echo "Instalando pacotes local..."
sudo apt install -y pcscd curl nano

echo "Instalação concluída!"

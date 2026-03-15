#!/bin/bash

THEME=$1

if [ -z "$THEME" ]; then
    echo "Uso: ./grub.sh <theme-name> (E.g.: hp)"
    exit 1
fi

echo " "
echo "----------------------------------"
echo "    Install GRUB Customizer"
echo "----------------------------------"
echo " "

sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install -y grub-customizer git

echo " "
echo "----------------------------------"
echo "   Install Distro GRUB Themes"
echo "----------------------------------"
echo " "


rm -rf distro-grub-themes

git clone https://github.com/AdisonCavani/distro-grub-themes.git

cd distro-grub-themes/themes || exit

sudo mkdir -p /usr/share/grub/themes/$THEME
sudo tar -C /usr/share/grub/themes/$THEME -xf $THEME.tar

sudo cp /etc/default/grub /etc/default/grub.baks

if grep -q "^GRUB_THEME=" /etc/default/grub; then
    sudo sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"/usr/share/grub/themes/$THEME/theme.txt\"|" /etc/default/grub
else
    echo "GRUB_THEME=\"/usr/share/grub/themes/$THEME/theme.txt\"" | sudo tee -a /etc/default/grub > /dev/null
fi

echo " "
echo "----------------------------------"
echo "           Update GRUB"
echo "----------------------------------"
echo " "

sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Theme '$THEME' installed!"

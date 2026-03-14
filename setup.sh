#!/bin/bash

echo "==== Atualizar sistema ===="
sudo apt update && sudo apt upgrade -y

echo "==== Verificar GPU NVIDIA ===="
if lspci | grep -i nvidia > /dev/null; then
    echo "GPU NVIDIA encontrada"

    echo "==== Drivers disponíveis ===="
    ubuntu-drivers devices

    echo "==== Instalar driver recomendado ===="
    sudo ubuntu-drivers autoinstall

    echo "==== Instalar NVIDIA Settings ===="
    sudo apt install -y nvidia-settings

else
    echo "Nenhuma GPU NVIDIA encontrada"
fi

echo "==== Setup concluído ===="
sudo reboot




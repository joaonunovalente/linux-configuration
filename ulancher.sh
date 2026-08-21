#!/bin/bash

# ----------------------------
# Repositórios e instalação
# ----------------------------
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:agornostal/ulauncher -y

sudo apt update
sudo apt install -y ulauncher

# ----------------------------
# Reiniciar Ulauncher para aplicar mudanças
# ----------------------------
ulauncher -q

echo "✅ Ulauncher instalado com sucesso!"

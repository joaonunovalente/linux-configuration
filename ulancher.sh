#!/bin/bash

# ----------------------------
# Repositórios e instalação
# ----------------------------
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:agornostal/ulauncher -y

sudo apt update
sudo apt install -y ulauncher

# ----------------------------
# Garantir pasta de configuração
# ----------------------------
mkdir -p ~/.config/ulauncher

CONFIG_FILE="$HOME/.config/ulauncher/settings.json"

# ----------------------------
# Atualizar ou criar settings.json
# ----------------------------
if [ -f "$CONFIG_FILE" ]; then
    # Atualiza apenas o campo "show-indicator-icon"
    python3 - <<EOF
import json, os

config_file = os.path.expanduser("$CONFIG_FILE")
with open(config_file, "r") as f:
    data = json.load(f)

# Desativa o ícone de tray
data["show-indicator-icon"] = False

with open(config_file, "w") as f:
    json.dump(data, f, indent=4)
EOF
else
    # Cria arquivo novo com o campo
    cat > "$CONFIG_FILE" <<EOL
{
    "show-indicator-icon": false
}
EOL
fi

# ----------------------------
# Configurar autostart
# ----------------------------
mkdir -p ~/.config/autostart
cp /usr/share/applications/ulauncher.desktop ~/.config/autostart/

# ----------------------------
# Reiniciar Ulauncher para aplicar mudanças
# ----------------------------
ulauncher -q

echo "✅ Ulauncher instalado e show-indicator desativado!"

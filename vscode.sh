#!/usr/bin/env bash
set -e

echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install -y wget gpg apt-transport-https

echo "Installing Microsoft signing key..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
rm microsoft.gpg

echo "Adding VS Code repository..."
sudo tee /etc/apt/sources.list.d/vscode.sources > /dev/null <<EOF
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF

echo "Updating package list..."
sudo apt update

echo "Installing Visual Studio Code..."
sudo apt install -y code

echo "Done! Run 'code' to start VS Code."

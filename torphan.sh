#!/bin/bash

# Check if yay is installed
if ! command -v yay &> /dev/null; then
    echo "yay is not installed. Please install yay first."
    exit 1
fi

# Clean the system
echo "Cleaning the system using yay..."
yay -Sc --noconfirm  # Remove all cached packages that are not currently installed
yay -Scc --noconfirm # Remove all cached packages, including the ones that are installed
sudo pacman -Rns $(pacman -Qtdq) --noconfirm # Remove all orphaned packages
sudo paccache -r       # Remove all cached versions of installed and uninstalled packages

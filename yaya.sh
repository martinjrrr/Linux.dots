#!/bin/bash

# Check if yay is installed
if ! command -v yay &> /dev/null; then
    echo "yay is not installed. Please install yay first."
    exit 1
fi

# Update the system
echo "Updating system using yay..."
yay -Syu --noconfirm

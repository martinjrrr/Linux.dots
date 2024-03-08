#!/bin/bash

# Check if the user is root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Check for orphaned packages
orphans=$(pacman -Qdtq)

# Check if there are any orphaned packages
if [ -z "$orphans" ]; then
    echo "No orphaned packages found."
else
    echo "Orphaned packages found:"
    echo "$orphans"

    # Ask the user if they want to remove orphaned packages
    read -p "Do you want to remove these packages? (y/n): " answer
    if [ "$answer" = "y" ]; then
        echo "Removing orphaned packages..."
        pacman -Rns $orphans
    else
        echo "No packages removed."
    fi
fi

exit 0

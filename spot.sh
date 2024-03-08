#!/bin/bash

# Function to clean up when script is terminated
cleanup() {
    echo "Cleaning up..."
    killall spotifyd  # Terminate spotifyd process
    exit 0
}

# Trap the SIGINT signal (Ctrl+C) to call the cleanup function
trap cleanup SIGINT

# Execute spotifyd in the background
echo "Starting spotifyd..."
spotifyd &

# Execute spt in the foreground
echo "Starting spt..."
spt

# Call the cleanup function when spt exits
cleanup

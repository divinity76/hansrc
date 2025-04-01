#!/bin/bash

# Download .hansrc if not already present
if [ ! -f ~/.hansrc ]; then
    wget 'https://raw.githubusercontent.com/divinity76/bashrc/refs/heads/master/.hansrc' -O ~/.hansrc
    echo ".hansrc downloaded to your home directory."
else
    echo ".hansrc already exists, skipping download."
fi

# Append the source command to ~/.bashrc if it's not already there
if ! grep -Fxq "source ~/.hansrc" ~/.bashrc; then
    echo -e "\nsource ~/.hansrc" >> ~/.bashrc
    echo "source command added to ~/.bashrc."
else
    echo "source command already exists in ~/.bashrc, skipping insertion."
fi

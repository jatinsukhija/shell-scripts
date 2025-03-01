#!/bin/bash

# Define package list
PACKAGES=('git' 'vim' 'curl')

# Detect OS package manager
if command -v apt-get &> /dev/null; then
    PKG_MANAGER="apt-get"
    UPDATE_CMD="sudo apt-get update -y"
elif command -v yum &> /dev/null; then
    PKG_MANAGER="yum"
    UPDATE_CMD="sudo yum update -y"
elif command -v dnf &> /dev/null; then
    PKG_MANAGER="dnf"
    UPDATE_CMD="sudo dnf update -y"
elif command -v pacman &> /dev/null; then
    PKG_MANAGER="pacman"
    UPDATE_CMD="sudo pacman -Sy"
else
    echo "❌ Unsupported OS: No recognized package manager found!"
    exit 1
fi

# Update package lists before installation
echo "🔄 Updating package list..."
$UPDATE_CMD

# Install packages
for PACKAGE in "${PACKAGES[@]}"; do
    if dpkg -l | grep -qw "$PACKAGE" 2>/dev/null || rpm -q "$PACKAGE" &>/dev/null; then
        echo "✅ $PACKAGE is already installed."
    else
        echo "⏳ Installing $PACKAGE..."
        sudo $PKG_MANAGER install -y "$PACKAGE" && echo "✅ $PACKAGE installed successfully." || echo "❌ Failed to install $PACKAGE."
    fi
done


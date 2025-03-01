#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ This script must be run as root!"
    exit 1
fi

# Check if username is provided
if [ $# -ne 1 ]; then
    echo "❌ Usage: $0 <username>"
    exit 1
fi

USERNAME="$1"

# Check if user already exists
if id "$USERNAME" &>/dev/null; then
    echo "✅ User '$USERNAME' already exists."
    exit 0
fi

# Generate a random password
PASSWORD=$(openssl rand -base64 12)

# Create the user with home directory and add to 'devops' group
useradd -m -s /bin/bash -G devops "$USERNAME"

# Set the password
echo "$USERNAME:$PASSWORD" | chpasswd

# Force user to change password on first login
passwd --expire "$USERNAME"

# Print the generated password
echo "✅ User '$USERNAME' created successfully!"
echo "🔑 Temporary Password: $PASSWORD"

exit 0


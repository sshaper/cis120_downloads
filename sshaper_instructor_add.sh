#!/bin/bash

# ==============================
# Instructor Account Setup Script
# Creates user: sshaper
# Grants sudo privileges
# Installs SSH public key
# ==============================

USERNAME="sshaper"
PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJY97yL2tR9YAnpICp2tQQe1y2uVa1GrwTbtcyve0zCz shape@ScottsLaptop"

echo "Setting up instructor account..."

# Create user if it does not exist
if id "$USERNAME" &>/dev/null; then
    echo "User $USERNAME already exists."
else
    echo "Creating user $USERNAME..."
    adduser --disabled-password --gecos "" "$USERNAME"
fi

# Add user to sudo group
usermod -aG sudo "$USERNAME"

# Create .ssh directory
mkdir -p /home/$USERNAME/.ssh

# Add public key if not already present
if ! grep -q "$PUBLIC_KEY" /home/$USERNAME/.ssh/authorized_keys 2>/dev/null; then
    echo "$PUBLIC_KEY" >> /home/$USERNAME/.ssh/authorized_keys
    echo "Public key added."
else
    echo "Public key already exists."
fi

# Set correct permissions
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh
chmod 700 /home/$USERNAME/.ssh
chmod 600 /home/$USERNAME/.ssh/authorized_keys

echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME
chmod 440 /etc/sudoers.d/$USERNAME


echo "Instructor account setup complete."

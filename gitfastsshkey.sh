#!/bin/bash

KEY_PATH="$HOME/.ssh/id_ed25519"

echo "Stopping any existing ssh-agent..."
pkill ssh-agent 2>/dev/null || true

echo "Starting a new ssh-agent..."
eval "$(ssh-agent -s)"

if [ -f "$KEY_PATH" ]; then
  echo "SSH key already exists at $KEY_PATH"
  read -p "Do you want to generate a new key? (y/n) " generate
  if [[ "$generate" =~ ^[yY]$ ]]; then
    ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)" -f "$KEY_PATH"
  fi
else
  echo "Generating a new SSH key..."
  ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)" -f "$KEY_PATH"
fi

echo "Adding the key to the ssh-agent..."
ssh-add "$KEY_PATH"

echo "Your public key is:"
cat "${KEY_PATH}.pub"

echo "Copy this key and add it to GitHub at https://github.com/settings/ssh/new"
read -p "Press Enter after you have added the key..."

echo "Testing SSH connection to GitHub..."
ssh -T git@github.com

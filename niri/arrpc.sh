#!/bin/bash

# Set up PATH if needed (especially if using nvm or node installed in ~/.local or Nix)
export PATH="$HOME/.npm-global/bin:$PATH"

# Launch arrpc via npx
exec npx arrpc


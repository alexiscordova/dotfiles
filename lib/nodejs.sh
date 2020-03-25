#!/bin/bash

###############################################################################
# Node.js                                                                     #
###############################################################################

# Install and configure NVM
echo '📦 Installing NVM…'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

echo '📦 Loading NVM…'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

echo '📦 Configuring Latest Node.js…'
nvm install --lts
nvm use node

# Install Pure Prompt
echo '📦 Installing Pure Prompt…'
npm install --global pure-prompt

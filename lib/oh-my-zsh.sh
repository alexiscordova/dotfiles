#!/bin/bash

###############################################################################
# Oh My ZSH                                                                   #
###############################################################################

# Install zsh
echo '📦 Installing zsh'
brew install zsh

# Install Oh My Zsh
echo '📦 Installing Oh My Zsh!'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install ZSH Autosuggestions
echo '📦 ZSH Autosuggestions'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install ZSH Syntax Highlighting
echo '📦 ZSH Syntax Highlighting'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

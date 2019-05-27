#!/usr/bin/env bash

# Install Homebrew
if ! which brew > /dev/null; then
	echo '📦 Installing Homebrew'
	/usr/bin/ruby -e "$(curl -fsSL
https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install macOS apps
echo '📦 Installing Mac App Store CLI'
brew install mas

# Install Brewfile
echo '📦 Install OS X apps from Brewfile'
brew bundle install

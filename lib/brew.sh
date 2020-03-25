#!/usr/bin/env bash

# Install Homebrew
if ! which brew > /dev/null; then
  echo '📦 Installing Homebrew…'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# Make sure we’re using the latest Homebrew.
echo 'Updating Homebrew…'
brew update

# Upgrade any already-installed formulae.
echo 'Upgrading Homebrew…'
brew upgrade

# Install macOS apps
echo '📦 Installing Mac App Store CLI…'
brew install mas

# Install Brewfile
echo '📦 Install macOS apps from Brewfile…'
brew bundle install

# Run `brew cleanup`
echo 'Removing outdated Homebrew packages…'
brew cleanup

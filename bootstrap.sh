#!/bin/bash

cd $HOME

function runDotFiles() {
  cd bin &&
    rsync --exclude ".git/" \
          --exclude ".DS_Store" \
          --avh --no-perms . ~;
    source ~/.bash_profile
}

function runHomebrew() {
  source ./lib/brew.sh;
}

function runMacOS() {
  source ./lib/macOS.sh;
}

function runNano() {
  source ./lib/nano.sh;
}

function runNodeJS() {
  source ./lib/nodejs.sh;
}

function runOhMyZSH() {
  source ./lib/oh-my-zsh.sh;
}

function runAll() {
  runHomebrew && runMacOS && runNano && runNodeJS && runOhMyZSH;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  runDotFiles;
else
  read -p "What would you like to bootstrap? (dotfiles, homebrew, macOS, nano, nodeJS, ohmyzsh) " TYPE;
  echo "";

  [[ "$TYPE" == "dotfiles" ]] && runDotFiles;
  [[ "$TYPE" == "homebrew" ]] && runHomebrew;
  [[ "$TYPE" == "macOS" ]] && runMacOS;
  [[ "$TYPE" == "nano" ]] && runNano;
  [[ "$TYPE" == "nodeJS" ]] && runNodeJS;
  [[ "$TYPE" == "ohmyzsh" ]] && runOhMyZSH;
  [[ "$TYPE" == "all" ]] && runAll;
fi;

unset runDotFiles;

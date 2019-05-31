#!/bin/bash

function runDotFiles() {
  chmod -R 644 ${PWD}/bin/
  cp -r ${PWD}/bin/ ~
}

function runHomebrew() {
  source ${PWD}/lib/brew.sh;
}

function runMacOS() {
  source ${PWD}/lib/macOS.sh;
}

function runBash() {
  source ${PWD}/lib/bash.sh;
}

function runNodeJS() {
  source ${PWD}/lib/nodejs.sh;
}

function runOhMyZSH() {
  source ${PWD}/lib/oh-my-zsh.sh;
}

function runAll() {
  runDotFiles && runHomebrew && runMacOS && runBash && runNodeJS && runOhMyZSH;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  runDotFiles;
else
  read -p "What would you like to bootstrap? (all, dotfiles, homebrew, macOS, bash, nodeJS, ohmyzsh) " TYPE;
  echo "";

  [[ "$TYPE" == "dotfiles" ]] && runDotFiles;
  [[ "$TYPE" == "homebrew" ]] && runHomebrew;
  [[ "$TYPE" == "macOS" ]] && runMacOS;
  [[ "$TYPE" == "bash" ]] && runBash;
  [[ "$TYPE" == "nodeJS" ]] && runNodeJS;
  [[ "$TYPE" == "ohmyzsh" ]] && runOhMyZSH;
  [[ "$TYPE" == "all" ]] && runAll;
fi;

unset runDotFiles;

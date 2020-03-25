#!/bin/bash

function runDotFiles() {
  echo "Copying dotfiles…"

  chmod 644 $(find ${PWD}/bin -type f);
  rsync -avzh ${PWD}/bin/ ~/;

  source ~/.bash_profile;
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

function killAll() {
  source ${PWD}/lib/killall.sh;
}

function runAll() {
   runHomebrew && runMacOS && runBash && runNodeJS && runOhMyZSH && runDotFiles && killAll;
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
  [[ "$TYPE" == "kill" ]] && killAll;
fi;

unset runDotFiles;

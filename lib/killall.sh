#!/bin/bash

###############################################################################
# Restart affected applications                                               #
###############################################################################

function killThemAll() {
  echo "🤘🏽"
}

read -n1 -p "Kill all applications? [y/n]" killall
case $killall in
  y|Y) killThemAll ;;
  n|N) echo "Don't forget to restart!" ;;
esac

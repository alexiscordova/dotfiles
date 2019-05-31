#!/bin/bash

###############################################################################
# Restart affected applications                                               #
###############################################################################

function confirmKill() {
  read -n1 -p "This command will kill all relevant applications excluding the Terminal. For proper usage, don't forget to relaunch the Terminal (or restart entirely, for good measure). Press [ENTER] to proceed." killAllApps
  if [[ "$killAllApps" == "" ]]; then
    for app in "Dock" \
      "SystemUIServer" \
      "Finder" \
      "Google Chrome" \
      "Mail" \
      "Messages" \
      "SystemUIServer" \
      "TextEdit" \
      "Tweetbot"; do
      killall "${app}" &> /dev/null
    done
  fi
}

read -n1 -p "Kill all applications? [Y/n]" killall
case $killall in
  Y) confirmKill ;;
  n|N) echo "Don't forget to restart!" ;;
esac

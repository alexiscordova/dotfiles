#!/bin/bash

# ~/.macos — https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

echo '📦 Setting macOS Defaults…'

# Set computer name (as done via System Preferences → Sharing)
scutil --set ComputerName "Thunderdome"
scutil --set HostName "Thunderdome"
scutil --set LocalHostName "Thunderdome"

# Turn on Screen Sharing
sudo defaults write /var/db/launchd.db/com.apple.launchd/overrides.plist com.apple.screensharing -dict Disabled -bool false
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist

# Turn on File Sharing
sudo defaults write /var/db/launchd.db/com.apple.launchd/overrides.plist com.apple.AppleFileServer.plist -dict Disabled -bool false
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist

# Start up automatically after power failure
sudo systemsetup -setrestartfreeze on -setrestartpowerfailure on

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Set menu bar clock format (Day Hour:Minutes:Seconds AM/PM)
defaults write com.apple.menuextra.clock DateFormat -string "EEE h:mm:ss a"

# Show scrollbars automatically
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

###############################################################################
# Applications                                                                #
###############################################################################

# Use Plain Text mode as Default
defaults write com.apple.TextEdit RichText -int 0

# Use the system-native print preview dialog in Google Chrome
defaults write com.google.Chrome DisablePrintPreview -bool true

# Bypass the annoyingly slow t.co URL shortener in Tweetbot
defaults write com.tapbots.TweetbotMac OpenURLsDirectly -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

###############################################################################
# Dock                                                                        #
###############################################################################

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Wipe all default apps from the Dock
defaults write com.apple.dock persistent-apps -array

# Resize Dock
defaults write com.apple.dock tilesize -int 80

# Set Dock Magnification
defaults write com.apple.dock largesize -int 73

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Remove icon bounce
defaults write com.apple.dock no-bouncing -bool false

# Enable autohide
defaults write com.apple.dock autohide -bool true

# Show hidden app icons
defaults write com.apple.dock showhidden -bool true

# Remove Recent Applications stack
defaults write com.apple.dock show-recents -bool false

###############################################################################
# Finder                                                                      #
###############################################################################

# Show External Media
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# Show Internal Media
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true

# Show Removable Media
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show Network Volumes
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Show Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# Set Default Finder Location to Home Folder
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable .DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use icon view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "icnv"

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Set top left hot corner to Desktop
defaults write com.apple.dock wvous-tl-corner -int 4
defaults write com.apple.dock wvous-tl-modifier -int 0

# Set bottom left hot corner to Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Enable sort by name for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 96" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 88" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 88" ~/Library/Preferences/com.apple.finder.plist

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
General -bool true \
OpenWith -bool true \
Privileges -bool true

###############################################################################
# Terminal                                                                    #
###############################################################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Install Panic Palette
open "${PWD}/src/Panic Palette.terminal"

# Set Panic Palette theme as default
defaults write com.apple.terminal "Default Window Settings" -string "Panic Palette"

#!/bin/bash

# Dock : use 2D look on bottom
defaults write com.apple.dock no-glass -boolean YES
# Dock : auto hide
defaults write com.apple.dock autohide -bool true
# Battery status: show remaining battery time and hide percentage
defaults write com.apple.menuextra.battery ShowTime -string "YES"
defaults write com.apple.menuextra.battery ShowPercent -string "NO"
# Scrollbars : only visible when scrolling
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"
# Finder : don't hide ~/Library
chflags nohidden ~/Library
# Finder : show full path in title bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
# Screenshots : change file format to pdf
defaults write com.apple.screencapture type -string PDF
# System : hold key to repeat letter
defaults write -g ApplePressAndHoldEnabled -bool false
# System : disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# System : require password immediately after sleep or screensaver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
# Dashboard : enable dev mode
defaults write com.apple.dashboard devmode YES
# DiskUtility : enable debug menu to show hidden partitions
defaults write com.apple.DiskUtility DUDebugMenuEnabled 1
# AppStore : enable debug menu
defaults write com.apple.appstore ShowDebugMenu -boolean YES
# Quicklook : allow selecting text
defaults write com.apple.finder QLEnableTextSelection -bool TRUE
# QLcolorcode : use MenLo font
defaults write org.n8gray.QLColorCode font Menlo
# QLcolorcode : show 3 digit line numbers
defaults write org.n8gray.QLColorCode extraHLFlags '-l -j 3'
# Quicktime : autoplay on open
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen 1
# Quicktime : keep full-screen when switching app
defaults write com.apple.QuickTimePlayerX MGFullScreenExitOnAppSwitch 0
# Safari : rm "are you sure to close"
defaults write com.apple.Safari DebugConfirmTossingUnsubmittedFormText NO
# Skim : autoreload on change
defaults write -app Skim SKAutoReloadFileUpdate -boolean true
# Skim : enable apple remote
defaults write -app Skim SKEnableAppleRemote -boolean true
# TimeMachine : don't ask to use new disks
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
# TimeMachine : disable local backups
hash tmutil &> /dev/null && sudo tmutil disablelocal
# Kill Dock and Finder
killall Dock; killall Finder

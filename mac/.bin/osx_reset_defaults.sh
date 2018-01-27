# osx_reset_defaults.sh
# This script changes the settings of your computer using `defaults`.
# DO NOT RUN THIS SCRIPT UNLESS THAT IS WHAT YOU WANT. YOU'VE BEEN WARNED.

### APPEARANCE AND LOOK AND FEEL.

# Window buttons. Color = 1, Gray = 6
defaults write NSGlobalDomain AppleAquaColorVariant -int 6
# Selected color.
defaults write NSGlobalDomain AppleHighlightColor -string "0.780400 0.815700 0.858800"
# Disable transparency (it does not look good).
defaults write com.apple.universalaccess reduceTransparency -bool true
# Set strong font smoothing on LCD screen.
defaults write NSGlobalDomain AppleFontSmoothing -int 3

### FINDER

# Enable status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Enable path bar
defaults write com.apple.finder ShowPathbar -bool true
# Disable warning on file extension change
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

### OTHER BEHAVIOURS

# Stop with the cursor shaking. It's not funny at all.
defaults write ~/Library/Preferences/.GlobalPreferences CGDisableCursorLocationMagnification -bool YES
# Enable PowerChime (beep when plugged to AC).
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true
open /System/Library/CoreServices/PowerChime.app
# I know a place where you can put iCloud on, Apple.
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

### RESTART APPLICATIONS.

killall Dock
killall Finder

# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run ./set-defaults.sh and you'll be good to go.
if [ `uname -s` = "Darwin" ]
then
	# Always open everything in Finder's list view. This is important.
	defaults write com.apple.Finder FXPreferredViewStyle Nlsv

	# Show the ~/Library folder
	chflags nohidden ~/Library

	# disable the horrible side swipe history control on Chrome
	defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

	# enable Airdrop over wired
	defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
fi

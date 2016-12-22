toggleHiddenFiles() {
	[[ "$(defaults read com.apple.finder AppleShowAllFiles)" == true ]] && local tmp=false || local tmp=true
	defaults write com.apple.finder AppleShowAllFiles $tmp
	killall Finder
}

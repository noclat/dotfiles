# Toggle Hidden Files
toggleHiddenFiles() {
	if [[ `uname` == 'Darwin' ]]
		[[ "$(defaults read com.apple.finder AppleShowAllFiles)" == true ]] && local tmp=false || local tmp=true
		defaults write com.apple.finder AppleShowAllFiles $tmp
		killall Finder
	fi
}


# Remove dot files
rmall() {
	if [[ `uname` == 'Linux' ]]
	then
		find ./ -type f | grep .DS_Store | xargs -r rm
		find . -iname "._*" | xargs -r rm
		find . -iname "*~" | xargs -r rm
		find ./ -type f | grep Thumbs.db | xargs -r rmd
	elif [[ `uname` == 'Darwin' ]]
	then
		find ./ -type f | grep .DS_Store | xargs rm
		find . -iname "._*" | xargs rm
		find . -iname "*~" | xargs rm
		find ./ -type f | grep Thumbs.db | xargs rm
	fi
	success "Temp files (.DS_Store, Thumbs.db, ._*, *~) deleted."
}

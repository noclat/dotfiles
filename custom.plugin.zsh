ask() { echo $fg[blue]$1$fg[normal] }
explain() { echo $fg[yellow]$1$fg[normal] }
success() { echo $fg[green]$1$fg[normal] }
error() { echo $fg[red]$1$fg[normal] }


# Toggle Hidden Files
toggleHiddenFiles() {
	if [[ `uname` == 'Darwin' ]]
	then
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

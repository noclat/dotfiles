# Global
# --------------------
.PHONY: apps all tools apache git check
apps:
	@ echo "Downloading apps:"
	( cd ~/Downloads && curl -O https://iterm2.com/downloads/stable/iTerm2-3_0_12.zip )
	( cd ~/Downloads && curl -O https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg )
	( cd ~/Downloads && curl -LO https://atom.io/download/mac )
	( cd ~/Downloads && curl -O https://github.com/sequelpro/sequelpro/releases/download/release-1.1.2/sequel-pro-1.1.2.dmg )
	@ echo "Done."
	@ echo "-- Please manually install iTerm and Atom before continuing."

all:
	@ make tools
	@ make apache
	@ make git

tools:
	@ make zsh
	@ make zsh_plugins
	@ make zsh_config
	@ make homebrew
	@ make watch
	@ make node
	@ make xcode
	@ make atom_config

apache:
	@ make localhost
	@ make php
	@ make mysql

git:
	@ make check
	@ echo "Configuring Git:"
	git config --global user.name ${username}
	git config --global user.email ${email}
	@ echo "Generating SSH Key:"
	ssh-keygen -t rsa -b 4096 -C "${email}"
	ssh-add ~/.ssh/id_rsa
	pbcopy < ~/.ssh/id_rsa
	@ echo "Public key copied to clipboard, now pushing to Github:"
	curl -u "${username}" --data "{\"title\":\"test-key\",\"key\":\"$$(< ~/.ssh/id_rsa.pub)\"}" https://api.github.com/user/keys
	@ echo "-- Please manually add key to Gitlab: https://gitlab.com/profile/keys."

check:
	ifeq ($(and $(username),$(email)),)
		@ $(error "Missing arguments username and/or email.")
	endif


# Terminal
# --------------------
.PHONY: zsh zsh_plugins zsh_config
zsh:
	@ echo "Installing Oh My ZSH:"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

zsh_plugins:
	@ echo "Installing ZSH plugins:"
	mkdir -p ~/.oh-my-zsh/plugins/atom
	curl -o ~/.oh-my-zsh/plugins/atom/atom.plugin.zsh https://raw.githubusercontent.com/semperos/oh-my-zsh/master/plugins/atom/atom.plugin.zsh
	mkdir -p ~/.oh-my-zsh/plugins/thf
	cp thf.plugin.zsh ~/.oh-my-zsh/plugins/thf/

zsh_config:
	@ echo "Importing configuration files:"
	cp {.gitconfig,.zshrc,.vimrc} ~/
	source ~/.zshrc


# System dependencies
# -------------------
.PHONY: homebrew watch xcode
homebrew:
	@ echo "Installing Homebrew:"
	hash brew 2>/dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

watch:
	@ echo "Installing watch command:"
	brew install watch
	sudo mv /usr/local/Cellar/watch/*/bin/watch /usr/local/bin

xcode:
	@ echo "Looking for XCode Command Line Tools:"
	@ gcc


# Localhost
# -------------------
.PHONY: localhost php mysql node
localhost:
	@ make check
	@ echo "Creating ~/Localhost:"
	mkdir -p ~/Localhost
	@ echo "Configuring Apache:"
	@ sed -i.bak "s/<username>/${username}/g" httpd.conf
	@ sed -i.bak "s/you@example.com/${email}/g" httpd.conf
	@ rm httpd.conf.bak
	sudo mv httpd.conf /etc/apache2/

php:
	@ echo "Setting PHP Timezone:"
	@ sudo sed -i.bak "s/^.*date\.timezone =.*/date.timezone = \"Europe\/Paris\"/g" /etc/php.ini
	@ echo "Installing PHP 7:"
	curl -s http://php-osx.liip.ch/install.sh | bash -s 7.0
	@ echo "-- Please check if php5_module is commented in /etc/apache2/httpd.conf"

mysql:
	@ echo "Installing MySQL 5.6:"
	brew install homebrew/versions/mysql56
	@ echo "Making MyQSL launch on boot:"
	ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents

node:
	@ echo "Installing Node.js:"
	hash node 2>/dev/null || brew install node


# Misc
# -------------------
.PHONY: atom_config
atom_config:
	@ echo "Initializing Atom config:"
	cp config.cson ~/.atom/@ echo "Done."

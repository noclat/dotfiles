.PHONY: apps tools apache git

apps:
	@ echo "Downloading apps:"
	( cd ~/Downloads && curl -O https://iterm2.com/downloads/stable/iTerm2-3_0_12.zip )
	( cd ~/Downloads && curl -O https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg )
	( cd ~/Downloads && curl -LO https://atom.io/download/mac )
	( cd ~/Downloads && curl -O https://github.com/sequelpro/sequelpro/releases/download/release-1.1.2/sequel-pro-1.1.2.dmg )
	@ echo "Done."
	@ echo "-- Please manually install iTerm and Atom before continuing."

tools:
	@ echo "Initializing Atom config:"
	cp config.cson ~/.atom/
	@ echo "Installing Oh My ZSH:"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	@ echo "Installing ZSH plugins:"
	mkdir -p ~/.oh-my-zsh/plugins/atom
	curl -o ~/.oh-my-zsh/plugins/atom/atom.plugin.zsh https://raw.githubusercontent.com/semperos/oh-my-zsh/master/plugins/atom/atom.plugin.zsh
	mkdir -p ~/.oh-my-zsh/plugins/thf
	cp thf.plugin.zsh ~/.oh-my-zsh/plugins/thf/
	@ echo "Importing configuration files:"
	cp {.gitconfig,.zshrc,.vimrc} ~/
	source ~/.zshrc
	@ echo "Installing Homebrew:"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@ echo "Installing watch command:"
	brew install watch
	sudo mv /usr/local/Cellar/watch/*/bin/watch /usr/local/bin
	@ echo "Installing Node.js:"
	brew install node
	@ echo "Looking for XCode Command Line Tools:"
	@ gcc
	@ echo "Done."

username = "<username>"
email = "you@example.com"
apache:
	@ echo "Creating ~/Localhost:"
	mkdir -p ~/Localhost
	@ echo "Configuring Apache:"
	@ sed -i.bak "s/<username>/${username}/g" httpd.conf
	@ sed -i.bak "s/you@example.com/${email}/g" httpd.conf
	@ rm httpd.conf.bak
	sudo mv httpd.conf /etc/apache2/
	@ echo "Setting PHP Timezone:"
	@ sudo sed -i.bak "s/^.*date\.timezone =.*/date.timezone = \"Europe\/Paris\"/g" /etc/php.ini
	@ echo "Installing PHP 7:"
	curl -s http://php-osx.liip.ch/install.sh | bash -s 7.0
	@ echo "Installing MySQL 5.6:"
	brew install homebrew/versions/mysql56
	@ echo "Making MyQSL launch on boot:"
	ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
	@ echo "Done."
	@ echo "-- Please check if php5_module is commented in /etc/apache2/httpd.conf"

git:
	@ echo "Configuring Git:"
	git config --global user.name ${username}
	git config --global user.email ${email}
	@ echo "Generating SSH Key:"
	ssh-keygen -t rsa -b 4096 -C "${email}"
	ssh-add ~/.ssh/id_rsa
	pbcopy < ~/.ssh/id_rsa
	@ echo "Public key copied to clipboard, now pushing to Github:"
	curl -u "${username}" --data "{\"title\":\"test-key\",\"key\":\"$$(< ~/.ssh/id_rsa.pub)\"}" https://api.github.com/user/keys
	@ echo "Done."
	@ echo "-- Please manually add key to Gitlab: https://gitlab.com/profile/keys."

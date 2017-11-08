# Global
# --------------------
.PHONY: all

all:
	@ make zsh
	@ make zsh_config
	@ make localhost
	@ make homebrew
	@ make git
	@ make watch
	@ make node
	@ make yarn
	@ make atom_config
	@ make atom_packages


# Git
# --------------------
.PHONY: git git_check_credentials
key = $(shell hostname)
git:
	@ make git_check_credentials
	@ echo "-- Configuring Git:"
	git config --global user.name ${username}
	git config --global user.email ${email}
	@ echo "-- Generating SSH Key:"
	ssh-keygen -t rsa -b 4096 -C "${email}"
	ssh-add ~/.ssh/id_rsa
	pbcopy < ~/.ssh/id_rsa.pub
	@ echo "-- Public key copied to clipboard, now pushing to Github:"
	curl -u "${username}" --data "{\"title\":\"${key}\",\"key\":\"$$(< ~/.ssh/id_rsa.pub)\"}" https://api.github.com/user/keys
	@ echo "-- Please manually add key to Gitlab: https://gitlab.com/profile/keys."

git_check_credentials:
ifeq ($(and $(username),$(email)),)
	@ $(error "Missing arguments username and/or email.")
endif


# Terminal
# --------------------
.PHONY: zsh zsh_config
zsh:
	@ echo "-- Installing Oh My ZSH:"
	sh -c "$$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

zsh_config:
	@ echo "-- Importing configuration files:"
	mkdir -p ~/.oh-my-zsh/plugins/custom
	cp custom.plugin.zsh ~/.oh-my-zsh/plugins/custom/
	cp {.gitconfig,.zshrc,.vimrc} ~/
	source ~/.zshrc


# System dependencies
# -------------------
.PHONY: homebrew watch
homebrew:
	@ echo "-- Installing Homebrew:"
	hash brew 2>/dev/null || /usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

watch:
	@ echo "-- Installing watch command:"
	brew install watch


# Localhost
# -------------------
.PHONY: localhost node yarn
localhost:
	@ make check
	@ echo "-- Creating ~/Localhost:"
	mkdir -p ~/Localhost

node:
	@ echo "-- Installing Node.js:"
	hash node 2>/dev/null || brew install node

yarn:
	@ echo "-- Installing Yarn:"
	hash yarn 2>/dev/null || brew install yarn


# Atom editor
# -------------------
.PHONY: atom_config atom_packages
atom_config:
	@ echo "-- Copying Atom config:"
	cp config.cson ~/.atom/

atom_packages:
	@ echo "-- Installing Atom packages:"
	apm install auto-detect-indentation
	apm install color-picker
	apm install tidy-markdown
	apm install language-javascript-jsx
	apm install language-json-comments

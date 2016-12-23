## Quick setup
```sh
# 1. Download repo
sh -c "$(curl -fsSL https://raw.githubusercontent.com/noclat/mac-env/master/install.sh)"
cd ~/Downloads/mac-env-master

# 2. Download iTerm, Atom, Chrome and Sequel Pro
make apps

# 3. Install Iterm and Atom
# 4. Open Atom and click "Install Shell Commands"
# 5. Setup environment
make all username=<username> email=<email>
```

**Note:** it assumes your computer and Github usernames match. If not, replace step 5 with:

```sh
make tools
make apache username=<username> email=<email> # computer username
make git username=<username> email=<email> # github username
```

Read [Makefile](Makefile) for commands details.

## Quick setup
```sh
# Download repo
curl -LO https://github.com/noclat/mac-env/archive/master.zip && unzip master.zip && rm master.zip

# Download iTerm, Atom, Chrome and Sequel Pro
make apps

# 1. Install Iterm and Atom
# 2. Open Atom and click "Install Shell Commands"
# 3. Continue setup
make all username=<username> email=<email>
```

Read [Makefile](Makefile) for commands details.

**Note:** it assumes your computer and Github usernames match. If not, run commands separately:

```sh
make tools
make apache username=<username> email=<email> # computer username
make git username=<username> email=<email> # github username
```

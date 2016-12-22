## Quick setup
```sh
curl -LO https://github.com/noclat/mac-env/archive/master.zip && unzip master.zip && rm master.zip
make apps # Download iTerm, Atom, Chrome and Sequel Pro
make all username=<username> email=<email> # full setup
```

Read [Makefile](Makefile) for commands details.

**Note:** it assumes your computer and Github usernames match. If not, run commands separately:

```sh
make tools
make apache username=<username> email=<email> # computer username
make git username=<username> email=<email> # github username
```

## Misc
- Double click on [Toggle Hidden Files service](Toggle Hidden Files.workflow) to install.
- Download and install https://bjango.com/mac/skalacolor/.

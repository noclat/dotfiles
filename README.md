## Quick setup

```sh
# 1\. Download repo
sh -c "$(curl -fsSL https://raw.githubusercontent.com/noclat/mac-env/master/install.sh)"
cd ~/Downloads/mac-env-master

# 2\. Install iTerm and Atom
# 3\. Open Atom and click "Install Shell Commands"
# 4\. Setup environment
make all username=<username> email=<email>
```

**Note:** it assumes your computer and Github usernames match. If not, replace step 5 with:

```sh
make tools
make git username=<username> email=<email> # github username
make apache username=<username> email=<email> # computer username
```

Read <Makefile> for commands details.

## Apps quick access

- [iTerm 2](https://iterm2.com)
- [Atom](https://atom.io)
- [Skala Color](https://bjango.com/mac/skalacolor/)
- [Sequel Pro](https://www.sequelpro.com/)

## Other config

- iTerm 2 **Dark** theme, **Solarized Dark** colors preset
- Atom **Operator Mono** font
- Atom **One Dark** UI and Syntax themes
- Atom packages:

  - [auto-detect-indentation](https://atom.io/packages/auto-detect-indentation)
  - [color-picker](https://atom.io/packages/color-picker)
  - [language-javascript-jsx](https://atom.io/packages/language-javascript-jsx)
  - [minimap](https://atom.io/packages/minimap)
  - [tidy-markdown](https://atom.io/packages/tidy-markdown)

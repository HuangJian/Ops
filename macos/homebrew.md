# homebrew commands

## list all packages installed intentionally
```bash
brew leaves --installed-on-request | xargs -n1 brew desc --eval-all
brew ls --casks | xargs brew desc --eval-all
```

## backup & restore
```bash
brew bundle dump

brew bundle --file=./Brewfile
```

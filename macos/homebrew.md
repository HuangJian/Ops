# homebrew commands

## list all packages installed intentionally
```bash
brew leaves --installed-on-request | xargs -n1 brew desc
```

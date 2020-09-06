#!/bin/bash

if type 'git' > /dev/null 2>&1; then
		continue
else
  xcode-select --install
fi

if type 'brew' > /dev/null 2>&1; then
		continue
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update
brew upgrade
brew cask upgrade
brew bundle --file 'Brewfile'
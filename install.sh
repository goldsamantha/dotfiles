#!/usr/bin/env bash

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# My apps
CASKS=(
    notion
    spectacle
    dropbox
    iterm2
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}


# TODO: make this an array with sources and destinations
echo "Creating symlinks..."
ln -sf $PWD/.gitconfig $HOME/.gitconfig

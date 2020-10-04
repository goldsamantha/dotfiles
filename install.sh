#!/usr/bin/env bash

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update


# My libraries
LIBRARIES=(
    jq
    fish
    tree
)

echo "Installing libraries..."
brew install ${LIBRARIES[@]}

# change to fish shell
chsh -s /usr/local/bin/fish


# My apps
CASKS=(
    notion
    spectacle
    dropbox
    iterm2
    visual-studio-code
    spotify
    adobe-creative-cloud
    postman
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}


# TODO: make this an array with sources and destinations
# TODO can set vscode by doing
# code --install-package <blahhh> 

# colors
#bash -c  "$(curl -sLo- https://git.io/vQgMr)"

# vim
# install pathogen
if [ ! -d ".vim/"]; then
    mkdir -p $PWD/.vim/autoload $PWD/.vim/bundle && \
    curl -LSso $PWD/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi


echo "Creating symlinks..."
ln -sf $PWD/.gitconfig $HOME/.gitconfig
ln -sf $PWD/.vim $HOME/.vim
ln -sf $PWD/.vimrc $HOME/.vimrc


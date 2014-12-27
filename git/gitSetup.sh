#!/bin/bash
SRC_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

#set name and email
git config --global user.name "Alan Christianson"
git config --global user.email "git@c10n.net"

# set up global gitignore
ln -s $SRC_DIR/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global


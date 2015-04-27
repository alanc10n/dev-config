#!/bin/bash
SRC_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# on OS X we can use .bash_profile, but on Linux desktops we'll
# want to use .profile instead (for a graphical, non-login shell)

OS=$(uname -s)
DEST=""
if [ "$OS" = "Darwin" ]; then
    DEST="${HOME}/.bash_profile"
elif [ "$OS" = "Linux" ]; then
    DEST="${HOME}/.profile"
else
    echo "Error: Unknown OS: $OS"
    return 1
fi

#check if dest exists so we don't blow away existing config
if [ -e $DEST ]; then
    cat "${SRC_DIR}/bash_profile" >> $DEST
else
    ln -s "${SRC_DIR}/bash_profile" $DEST
fi

#ensure directory exists for virtualenvs
mkdir -p "${HOME}/.virtualenvs"
echo "Log out and in again to apply bash profile"

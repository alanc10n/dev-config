#!/bin/bash
SRC_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# on OS X we can use .bash_profile, but on Linux desktops we'll
# want to use .bashrc instead 

OS=$(uname -s)
DEST=""
SRC="${SRC_DIR}/bash_profile"
LOCAL_CONFIG="${SRC_DIR}/bash_local"

# produce a local config file, which will either be 
# symlinked to the appropriate config file or sourced
# by an existing config file
cat "${SRC}" > "${LOCAL_CONFIG}"

if [ "$OS" = "Darwin" ]; then
    DEST="${HOME}/.bash_profile"
    # include mac-specific config
    cat "${SRC_DIR}/mac_profile" >> "${LOCAL_CONFIG}"
elif [ "$OS" = "Linux" ]; then
    DEST="${HOME}/.bashrc"
else
    echo "Error: Unknown OS: $OS"
    return 1
fi

# check if dest exists so we don't blow away existing config
if [ -e $DEST ]; then
    echo "source ${LOCAL_CONFIG}" >> "${DEST}"
else
    ln -s "${LOCAL_CONFIG}" "${DEST}"
fi

#ensure directory exists for virtualenvs
mkdir -p "${HOME}/.virtualenvs"
source "${DEST}"

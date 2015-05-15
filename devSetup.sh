#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
OS=$(uname -s)

if [ "$OS" = "Darwin" ]; then
    ${DIR}/osx/macSetup.sh
elif [ "$OS" = "Linux" ]; then
    ${DIR}/linux/linuxSetup.sh
fi

${DIR}/vim/vimSetup.sh
${DIR}/python/pythonSetup.sh
${DIR}/git/gitSetup.sh
${DIR}/bash/bashSetup.sh


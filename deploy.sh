#!/bin/bash

# check current workspace
echo ${PWD##*/}
if [ ${PWD##*/} == 'words-flashcard' ]
then
    echo '--- check workspace successfully ---'
    if git diff-index --quiet HEAD --; then
        echo '--- git history is clean ---'
    else
        echo '--- new words come today, add them to git ---'
    fi
else
    echo 'You are not in the workspace, will clone new repo automatically!'
    cd ~
    if command -v git >/dev/null 2>&1; then
        echo 'exists git,staring clone...'
        git clone https://github.com/huangyz0918/words-flashcard.git
        cd ~/words-flashcard
    else
        echo 'no git exists, please visit https://git-scm.com/downloads to install git first!'
    fi
fi

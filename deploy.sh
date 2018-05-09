#!/bin/bash

# set this script auto boot with system
installAutoBoot(){
    echo "---> run this to set boot option <---"
    sudo cp ./deploy.sh /etc/init.d
    sudo chmod 755 /etc/init.d/deploy.sh
    cd /etc/init.d
    sudo update-rc.d deploy.sh defaults 90
}

# uninstall auto boot option
uninstallAutoBoot(){
    cd /etc/init.d
    sudo update-rc.d -f test remove
}

# check current workspace
echo ${PWD##*/}
if [ ${PWD##*/} == 'words-flashcard' ]
then
    if command -v git >/dev/null 2>&1; then
        echo '---> check workspace successfully <---'
        if git diff-index --quiet HEAD --; then
            echo '---> git history is clean <---'
        else
            if [ -d "days" ]; then
                cd ./days
                todayFile=$(date "+%Y-%m-%d.md")
                touch $todayFile
                echo "## English words today: $(date "+%Y-%m-%d")" >> $todayFile
                echo "" >> $todayFile
                echo "| English Words | Word's property | Chinese description |" >> $todayFile
                echo "| :-----------: | :-------------: | :-----------------: |" >> $todayFile
                cd ..
                python3 ./loader.py
                cd ./days
                echo '---> new words come today, add them to git <---'
                git add .
                git commit -m "words: added new words today"
                git push -u origin master
                echo "- [ ] [$(date "+%Y-%m-%d")](./$todayFile)" >> README.md
            else
                echo '---> first day, build new workspace <---'
                mkdir ./days
                cd ./days
            fi
        fi
    else
        echo 'no git exists, please visit https://git-scm.com/downloads to install git first!'
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

# run in background
nohup ./autoboot.sh &

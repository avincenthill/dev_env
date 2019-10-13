#!/bin/bash

# define functions
handle_error () {
    echo 'There was an error with the last command. The script will now exit.'
    exit 1
}

pause () {
    echo -e
    read -p "Press enter to continue:"
    clear
}

# greet user
clear
echo 'This script sets up your development environment by overwriting dot and configuration files in your machine with config data in this repo.'
echo 'This script should be run from the root directory of this git repo.'
pause

# execute commands
{
    cp -i ./config/.vimrc ~/.vimrc
    echo 'Done!'
    pause
} || {
    handle_error
}

{
    cp -i ./config/.bashrc ~/.bashrc
    echo 'Done!'
    pause
} || {
    handle_error
}

{
    cp -i ./config/settings.json ~/Library/Application\ Support/Code/User/settings.json
    echo 'Done!'
    pause
} || {
    handle_error
}

echo 'Success! The script will now exit.'
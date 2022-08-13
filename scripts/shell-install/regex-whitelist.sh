#!/bin/bash

clear

# Create variable
URL=https://raw.githubusercontent.com/slyfox1186/pihole.regex/main/scripts

# Create "$HOME/pihole.regex" directory if not exist.
if [ ! -d "$HOME/pihole.regex" ]; then
    mkdir -p "$HOME/pihole.regex"
fi

# Change working directory to "$HOME/pihole.regex"
cd "$HOME/pihole.regex"

# Make user input case insensitive
shopt -s nocasematch; clear

# Get the user's input
echo -e "RegEx whitelist filters\\n\\nPlease choose an option: [A]dd or [R]emove: "
read a
clear
if [[ $a == "A" ]]; then
    /usr/bin/curl -sSl "$URL/python-install/regex-whitelist.py" | sudo python3
    echo 'Script complete: The RegEx whitelist filters have been added.'
else
    /usr/bin/curl -sSl "$URL/python-uninstall/regex-whitelist.py" | sudo python3
    echo 'Script complete: The RegEx whitelist filters have been removed.'
fi

read -p 'Press Enter to continue'

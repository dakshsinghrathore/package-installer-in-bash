#!/bin/bash

# this script will install packages in our system, given the condition that you are root

# COLORS
RED="\e[31m"
GREEN="\e[32m"
EXIT="\e[0m"

if [ $UID -ne 0 ]; then
    echo -e "${RED}ERROR: run as root user....${EXIT}"
    exit 1
fi

# packages that are going to be installed
PACKAGES=(figlet sl net-tools)

for i in "${PACKAGES[@]}"
do
    echo
    echo -e "${RED}[+] Installing $i .... ${EXIT}"
    apt install $i -y &>/dev/null
    if [ $? -eq 0 ]; then
        echo
        echo -e "${GREEN}[+] Installation of $i completed.${EXIT}"
        echo
    else
        echo
        echo -e "${RED}[x] Installation of $i failed.${EXIT}"
        echo
    fi
done


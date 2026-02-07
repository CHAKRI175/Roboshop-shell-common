#!/bin/bash

owner=($(id -u))
logs_dir="/var/log/RoboShop-shell" 
log_file="$logs_dir/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
NC="\e[0m"
Path=$PWD
START_TIME=$(date +%s)

mkdir -p $logs_dir

check_root() {
    if [ $owner -ne 0 ]; then
        echo -e "$R $(date "+%Y-%m-%d %H:%M:%S") Please run this script as root. $NC" | tee -a $log_file
        exit 1
    fi
}

if [ $owner -ne 0 ]; then
    echo -e "$R $(date "+%Y-%m-%d %H:%M:%S") Please run this script as root. $NC" | tee -a $log_file
    exit 1
fi

validate(){

    if [ $1 -ne 0 ]; then
        echo -e "$2 $R $(date "+%Y-%m-%d %H:%M:%S") ....installation failed. $NC" | tee -a $log_file
        exit 1
    else
        echo -e "$2 $G $(date "+%Y-%m-%d %H:%M:%S") ....installation successful. $NC" | tee -a $log_file
    fi
}




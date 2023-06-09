#!/usr/bin/env bash 

# global variables
green='\033[0;32m'
bold=$(tput bold)

# identifying the package manager
declare -A osInfo;
osInfo[/etc/redhat-release]="yum update && yum install"
osInfo[/etc/arch-release]="pacman -S"
osInfo[/etc/os-release]="pacman -S"
osInfo[/etc/gentoo-release]="emerge -ask"
osInfo[/etc/SuSE-release]="zypper update && zypper install"
osInfo[/etc/debian_version]="apt update && apt-get install"
osInfo[/etc/alpine-release]="apk update && apk add"

determineOsPackageManager(){
    for f in ${!osInfo[@]}
    do
        if [[ -f $f ]];then
            packageManagerInstallCommand=${osInfo[$f]}
        fi
    done
}
#!/usr/bin/env bash 

# global variables
green='\033[0;32m'
bold=$(tput bold)
reset='\033[0m'

export green 
export bold

# adding the scripts 
source determineOsPackageManager.sh
source installMinikube.sh
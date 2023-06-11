#!/usr/bin/env bash 

# global variables
green='\033[0;32m'
red='\033[0;31m'
bold=$(tput bold)
reset='\033[0m'

export green
export red  
export bold
export reset

# adding the scripts 
source determineOsPackageManager.sh
source installMinikube.sh
source doesBinaryExist.sh
source isDockerRunning.sh
source installHelm.sh
source installTerraform.sh


#!/usr/bin/env bash 

# global variables
green='\033[0;32m'
bold=$(tput bold)

# determining the right package manager
source determineOsPackageManager.sh

determineOsPackageManager

# installing Minikube 
source installMinikube.sh
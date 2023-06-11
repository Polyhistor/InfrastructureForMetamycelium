isDockerRunning() {
     # Check if Docker is running
    if ! docker info >/dev/null 2>&1; then
        echo -e "${red}Docker is not running. Please make sure Docker is running.${reset}"
        exit 1
    fi
}
 
confirm() {
    read -r -p "$1 [y/n]: " response
    case "$response" in
        [yY][eE][sS]|[yY]) return 0 ;;
        [nN][oO]|[nN]) return 1 ;;
        *) echo "Invalid response. Please answer 'yes' or 'no'." && return 1 ;;
    esac
}

if confirm "Do you want to stop and remove all containers?"; then
    docker-compose down
else
    echo "Skipping container removal."
fi

if confirm "Do you want to remove all images?"; then
    docker rmi -f $(docker images -q)
else
    echo "Skipping image removal."
fi

if confirm "Do you want to clean up unused volumes and networks?"; then
    docker volume prune -f
    docker network prune -f
else
    echo "Skipping cleanup of volumes and networks."
fi



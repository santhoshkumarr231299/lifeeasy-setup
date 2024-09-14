# Stop and remove all containers
docker-compose down
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

# Remove all images
docker rmi -f $(docker images -q)

# Optional: clean up unused volumes and networks
docker volume prune -f
docker network prune -f


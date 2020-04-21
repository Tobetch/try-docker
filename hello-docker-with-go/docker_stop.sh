# Check running Docker container
containerID=$(docker container ls --filter "ancestor=example/echo" -q)
MESSAGE="Docker container has been stopped."

# Stop Docker container
if [ -n $containerID ]; then
    docker container stop $containerID | echo $MESSAGE
fi

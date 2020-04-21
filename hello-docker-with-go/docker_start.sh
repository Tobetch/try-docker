# Make a Docker image (if not present)
APP_NAME="example/echo"
isPresentImage=$(docker image ls | grep $APP_NAME | awk '{print $1}')
if [ -z $isPresentImage ]; then
    docker image build -t example/echo:latest .
    echo "docker image has been built again."
fi

# Run Docker container as background(with setting port forwarding)
CONTAINER_ID=$(docker container ls -a --filter "ancestor=$APP_NAME" -q)
MESSAGE="Docker container has been started."
if [ -z $CONTAINER_ID ]; then
    PORT="-p 9000:8080"
    CONTAINER_NAME="--name hello-docker-with-go"
    docker container run -d $PORT $CONTAINER_NAME $APP_NAME:latest | echo $MESSAGE
else
    docker start $CONTAINER_ID | echo $MESSAGE
fi

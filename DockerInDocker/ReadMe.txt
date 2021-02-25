# Run Commands for Docker-out-Docker approach (Avoiding Docker in Docker approach)

#1
docker build -t docker-alpine .

#2
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock docker-alpine



# Ethereum Go client

This Dockerfile installs go-ethereum from PPA.

Forked from: https://registry.hub.docker.com/u/ethereum/client-go/

## Build it

docker build -t client-go .

## Run it

docker run -d -p 30303:30303/udp -p 8545:8545 --name=ethnode client-go


## Follow logs

docker logs -f ethnode

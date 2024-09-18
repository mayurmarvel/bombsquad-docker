# BombSquad Docker

[![Docker Pulls](https://img.shields.io/docker/pulls/freedump/bombsquad-docke?style=flat-square)](https://hub.docker.com/r/freedump/bombsquad-docker)

An unofficial docker image for server app of [BombSquad Game](https://www.froemling.net/apps/bombsquad)

## Usage

```bash
docker run -d -it \
    -p 43210:43210/udp \
    --name bombsquad \
    freedump/bombsquad-docker
```

You can use **config.yaml** in this repo.

### Dockerhub

See: <https://hub.docker.com/r/freedump/bombsquad-docker>

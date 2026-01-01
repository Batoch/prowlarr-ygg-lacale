# Prowlarr with YGGTorrent and LaCale Indexers

[![Auto Rebuild](https://github.com/Batoch/prowlarr-ygg-lacale/actions/workflows/auto-rebuild.yml/badge.svg)](https://github.com/Batoch/prowlarr-ygg-lacale/actions/workflows/auto-rebuild.yml)

An up-to-date Prowlarr Docker image with YGGTorrent indexers (Ygg-API, ygege and LaCale) indexer pre-installed.

```text
ghcr.io/batoch/prowlarr-ygg-lacale
```

## Features

- Based on the latest [hotio/prowlarr](https://hotio.dev/containers/prowlarr/) image
- Three indexers pre-installed in `/config/Definitions/Custom/`:
  - [Clemv95/Ygg-API](https://gist.github.com/Clemv95/8bfded23ef23ec78f6678896f42a2b60) using [yggapi](https://yggapi.eu/)
  - [UwUDev/ygege](https://github.com/UwUDev/ygege): see [ygege docker guide](https://github.com/UwUDev/ygege/blob/develop/docs/docker-guide.md) for docker setup
  - [JigSawFr/lacale-prowlarr-indexer](https://github.com/JigSawFr/lacale-prowlarr-indexer)
  
- Automatically rebuilds when the base image or either indexer is updated
- Ready to use after container startup

## Usage

### cli

```bash
docker run --rm \
    --name prowlarr \
    -p 9696:9696 \
    -e PUID=1000 \
    -e PGID=1000 \
    -e UMASK=002 \
    -e TZ="Europe/Paris" \
    -v /<host_folder_config>:/config \
    ghcr.io/batoch/prowlarr-ygg-lacale
```

### compose

```yaml
services:
  prowlarr:
    container_name: prowlarr
    image: ghcr.io/batoch/prowlarr-ygg-lacale
    ports:
      - "9696:9696"
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Paris
    volumes:
      - /<host_folder_config>:/config
```

## Configuration

After starting the container, the YGGTorrent indexers (Ygg-API and ygege) and the LaCale indexer will be available in Prowlarr's indexer settings:

![Prowlarr indexers screenshot](./Screenshot.png)

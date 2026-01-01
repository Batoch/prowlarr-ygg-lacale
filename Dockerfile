FROM ghcr.io/hotio/prowlarr:latest

# Download YGG-API indexer
RUN wget https://gist.githubusercontent.com/Clemv95/8bfded23ef23ec78f6678896f42a2b60/raw/f1c073f1994ab9c5c13ab68fa463ac2c862299c8/ygg-api-download.yml -O /app/indexer-definitions/ygg-api-download.yml

# Download ygege indexer
RUN wget https://raw.githubusercontent.com/UwUDev/ygege/refs/heads/master/ygege.yml -O /app/indexer-definitions/ygege.yml

# Download lacale indexer
RUN wget https://raw.githubusercontent.com/JigSawFr/lacale-prowlarr-indexer/refs/heads/main/lacale-api.yml -O /app/indexer-definitions/lacale-api.yml

# Copy init script and make it executable
COPY init-indexers.sh /app/init-indexers.sh
RUN chmod +x /app/init-indexers.sh && \
    chown hotio:hotio /app/init-indexers.sh

VOLUME /config
EXPOSE 9696

# Use custom entrypoint that copies indexer to mounted volume
ENTRYPOINT ["/app/init-indexers.sh"]

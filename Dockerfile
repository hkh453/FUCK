FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    ca-certificates \
    libstdc++6 \
    libgcc-s1 \
    fontconfig \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY FirstGameSERVER.x86_64 .
COPY FirstGameSERVER.pck .
RUN chmod +x FirstGameSERVER.x86_64

EXPOSE 0/udp

CMD ["sh", "-c", "./FirstGameSERVER.x86_64 --headless"] 
#### --server --port $PORT"]

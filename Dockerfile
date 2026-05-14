#FROM debian:bookworm-slim

#RUN apt-get update && apt-get install -y \
#    ca-certificates \
#    libstdc++6 \
#    libgcc-s1 \
#    fontconfig \
#    && rm -rf /var/lib/apt/lists/*

#WORKDIR /app

#COPY FirstGameSERVER.x86_64 .
#COPY FirstGameSERVER.pck .
#RUN chmod +x FirstGameSERVER.x86_64

#EXPOSE 10000/tcp

#CMD ["sh", "-c", "./FirstGameSERVER.x86_64 --headless --server --port $PORT"]

FROM debian:bookworm-slim

WORKDIR /app

# copy your exported Godot server files
COPY . .

# make sure binary is executable
RUN chmod +x FirstGameSERVER.x86_64

# Render will assign PORT automatically
#ENV PORT=4433

#EXPOSE 4433
# CMD ["./UnnamedProject.x86_64", "--headless", "--server", "--port", "4433"]
#CMD ["sh", "-c", "./UnnamedProject.x86_64 --headless"]
#CMD ["sh", "-c", "./FirstGameSERVER.x86_64 --headless --server --bind 0.0.0.0 --port $PORT"]
CMD ["sh", "-c", "echo PORT=$PORT && ./UnnamedProject.x86_64 --headless --server --port $PORT"]

# Gunakan image dasar Node.js
FROM node:20-bullseye-slim

# Install dependencies yang dibutuhkan
RUN apt update && \
    apt install -y ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool iputils-ping

# Install npm dan PM2
RUN npm install npm@latest -g
RUN npm install pm2 -g

# Buat user untuk container
RUN useradd -m -d /home/container container

# Set environment variables
USER container
ENV USER=container HOME=/home/container

# Set working directory
WORKDIR /home/container

# Salin entrypoint script
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]

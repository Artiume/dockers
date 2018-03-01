FROM nextcloud:12.0.4

LABEL maintainer.name="Anthony PERIQUET"
LABEL maintainer.email="anthony@periquet.net"
LABEL version="smbclient"
LABEL description="A safe home for all your data"

RUN apt-get update && apt-get install -y smbclient && rm -rf /var/lib/apt/lists/*

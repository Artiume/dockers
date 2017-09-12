FROM arm32v7/python:3.6.2

LABEL maintainer.name="Anthony PERIQUET"
LABEL maintainer.email="anthony@periquet.net"
LABEL version="1.0.2"
LABEL description="Swarm-monitor"

RUN pip3 install blinkt docker && \
    git clone https://github.com/xylphid/docker-monitor.git /usr/src/app/ && \
    chmod +x /usr/src/app/app.py

ENTRYPOINT [ "/usr/src/app/app.py" ]
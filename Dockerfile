FROM node

ENV BUCKY_VERSION 0.4.1
ENV PORT=8128
EXPOSE 8128

RUN wget https://github.com/HubSpot/BuckyServer/archive/v$BUCKY_VERSION.tar.gz -O /opt/BuckyServer.tar.gz && \
    mkdir -p /opt/BuckyServer && \
    tar --strip-components=1 -xzf /opt/BuckyServer.tar.gz -C /opt/BuckyServer

RUN cd /opt/BuckyServer && npm install

ADD default.yaml.template /opt/BuckyServer/config/default.yaml.template

ADD serve /opt/BuckyServer/serve
RUN chmod +x /opt/BuckyServer/serve

WORKDIR /opt/BuckyServer

CMD ["./serve"]

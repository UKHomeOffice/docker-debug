FROM alpine:latest
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
COPY entrypoint.sh  /entrypoint.sh

RUN apk add --no-cache openssh ca-certificates curl bash tcpdump

ADD https://github.com/pixie79.keys /home/pixie79/.ssh/authorized_keys

RUN \
  chmod +x entrypoint.sh && \
  adduser -D -s /bin/bash pixie79 && \
  passwd -u pixie79 && \
  chown -R pixie79:pixie79 /home/pixie79 

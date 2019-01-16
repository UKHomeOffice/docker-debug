FROM alpine:latest
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
COPY entrypoint.sh  /entrypoint.sh

RUN apk add --no-cache openssh ca-certificates curl bash tcpdump

ADD https://github.com/pixie79.keys /home/user/.ssh/authorized_keys

RUN \
  chmod +x entrypoint.sh && \
  adduser -D -s /bin/bash user && \
  passwd -u user && \
  chown -R user:user /home/user /etc/ssh/

USER 1000

FROM quay.io/ukhomeofficedigital/docker-node:master

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 2222
COPY entrypoint.sh  /entrypoint.sh

RUN apk add --no-cache openssh ca-certificates curl bash 

ADD https://github.com/pixie79.keys /home/user/.ssh/authorized_keys
COPY server.js /server.js

RUN \
  chmod +x entrypoint.sh && \
  adduser -D -u 1001 -s /bin/bash user && \
  passwd -u user && \
  chown -R user:user /home/user /etc/ssh/

USER 1001

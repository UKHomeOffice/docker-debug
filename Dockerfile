FROM quay.io/ukhomeofficedigital/docker-node:master

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 2222
COPY entrypoint.sh  /entrypoint.sh

RUN apk add --no-cache openssh ca-certificates curl bash 

ADD https://github.com/pixie79.keys /home/node/.ssh/authorized_keys
COPY inidex.html /index.html

RUN \
  chmod +x entrypoint.sh && \
  npm install http-server -g && \
  touch /run/sshd.pid && \
  chown -R node:node /home/node /etc/ssh/ /run/sshd.pid

USER 1000

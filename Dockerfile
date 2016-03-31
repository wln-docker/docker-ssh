FROM gliderlabs/alpine

WORKDIR /src
ADD . .

RUN apk --update add python make g++ nodejs \
  && npm install \
  && apk del make gcc g++ python \
  && rm -rf /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp


# make coffee executable
RUN chmod +x ./node_modules/coffee-script/bin/coffee

# Connect to container with name/id
ENV CONTAINER=

# Shell to use inside the container
ENV CONTAINER_SHELL=bash

# Server key
ENV KEYPATH=./id_rsa

ENV AUTH_MECHANISM=noAuth

# Server port
ENV PORT=2222

# Enable web terminal
ENV HTTP_ENABLED=true

# HTTP Port
ENV HTTP_PORT=8022

EXPOSE 2222 8022

CMD ["npm", "start"]

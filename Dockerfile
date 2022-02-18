FROM node:17-alpine

# Install core packages
RUN apk update && apk add --no-cache bash curl git

# Install Python and PIP
RUN \
  apk add --no-cache --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make && \
  apk add --no-cache py3-pip

# Install Azure CLI
RUN pip3 --no-cache-dir install azure-cli==2.10.1

# Cleanup
RUN apk del --purge build && rm -rf /var/cache/apk/*

RUN yarn config set ignore-engines true

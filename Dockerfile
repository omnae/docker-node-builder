FROM node:14-alpine

# Install core packages
RUN apk update && apk add --no-cache bash curl git

# Install Python and PIP
RUN apk add --no-cache py-pip && \
  apk add --no-cache --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make

# Install Azure CLI
RUN pip --no-cache-dir install azure-cli=2.10.1

# Cleanup
RUN apk del --purge build && rm -rf /var/cache/apk/*

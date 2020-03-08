FROM node:13-alpine

# Install core packages
RUN apk update && \
  apk add bash curl git openssh docker jq make py-pip

# Install Python and PIP
RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev py-setuptools ca-certificates groff less

# Install Docker Compose
RUN pip --no-cache-dir install docker-compose

# Install AWS CLI
RUN pip --no-cache-dir install awscli

# Install Azure CLI
RUN pip --no-cache-dir install azure-cli

# Cleanup
RUN apk del --purge build && \
  rm -rf /var/cache/apk/*

# Install Node.js packages
RUN yarn global add bunyan
RUN yarn config set ignore-engines true

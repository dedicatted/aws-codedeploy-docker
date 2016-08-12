FROM node:argon

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
COPY server.js /usr/src/app

EXPOSE 8080
CMD [ "node", "server.js" ]
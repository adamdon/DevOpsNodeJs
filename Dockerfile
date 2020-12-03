# sets a 6.14.2 Node.Js base image
FROM node:6.14.2

# set the maintainer name
LABEL maintainer "mail@adamdon.co.uk"

# copies the file "server.js" to the to directory "."
COPY server.js .

# sets port 8080 to open
EXPOSE 8080

# runs the command to start the server
CMD node server.js

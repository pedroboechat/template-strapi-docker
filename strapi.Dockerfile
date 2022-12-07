# Node v18.x is recommended for Strapi v4.3.9 and above
FROM node:18-bullseye

# Declare ARGS
ARG DB_CLIENT_ARG
ARG DB_HOST_ARG
ARG DB_PORT_ARG
ARG DB_NAME_ARG
ARG DB_USER_ARG
ARG DB_PSWD_ARG
ARG DB_SSL_ARG

# Declare ENVS
ENV DB_CLIENT=$DB_CLIENT_ARG
ENV DB_HOST=$DB_HOST_ARG
ENV DB_PORT=$DB_PORT_ARG
ENV DB_NAME=$DB_NAME_ARG
ENV DB_USER=$DB_USER_ARG
ENV DB_PSWD=$DB_PSWD_ARG
ENV DB_SSL=$DB_SSL_ARG

# Set WORKDIR
WORKDIR /

# Set ENV variables
ENV HOST=0.0.0.0
ENV PORT=1337

# Upgrade NPM
RUN npm install -g npm@latest

# Install Strapi CLI
RUN npm install -g @strapi/strapi@latest

# Start Strapi server
COPY strapi.entrypoint.sh /
ENTRYPOINT [ "/bin/bash", "/strapi.entrypoint.sh" ]

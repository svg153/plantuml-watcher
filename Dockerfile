FROM timbru31/java-node:11-azul-alpine-jdk-fermium
LABEL maintainer="oscar.berg <oscar@oscarberg.com>"

ENV PLANTUML_VERSION 1.2024.7
ENV LANG en_US.UTF-8
RUN apk add --no-cache graphviz ttf-droid ttf-droid-nonlatin curl \
    && mkdir /app \
    && curl -L https://github.com/plantuml/plantuml/releases/download/v1.2024.7/plantuml-mit-1.2024.7.jar -o /app/plantuml.jar \
    && apk del curl

COPY package.json /
COPY index.js /
COPY docker-entrypoint.sh /

RUN npm install

ENTRYPOINT [ "/docker-entrypoint.sh" ]

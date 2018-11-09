FROM mhart/alpine-node:latest
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

# --no-cache: download package index on-the-fly, no need to cleanup afterwards
# --virtual: bundle packages, remove whole bundle at once, when done
# RUN apk --no-cache --virtual build-dependencies add \
RUN apk --no-cache --virtual build-dependencies add \
    bash \
    ruby \
    ruby-irb \
    python \
    php5 \
    make \
    g++ \
    && npm install
    # && apk del build-dependencies

EXPOSE 3000
CMD [ "npm", "start" ]

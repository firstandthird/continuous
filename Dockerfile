FROM node:6-alpine

RUN apk add --update docker git bash curl
ADD https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

RUN npm i -g --silent --progress=false hubhooks@0.0.5

ENV PORT=8080
ENV SECRET=""
ENV GITHUB_TOKEN=""
ENV SLACK_HOOK=""
ENV SLACK_USERNAME="Continuous"
ENV SLACK_ICON_EMOJI=":floppy_disk:"
ENV SLACK_CHANNEL=""
ENV DOMAIN=""

VOLUME /repos

EXPOSE 8080

COPY scripts /scripts
ENV SCRIPTS="/scripts"

CMD ["dumb-init", "hubhooks"]

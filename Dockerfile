# syntax=docker/dockerfile:1

FROM node:latest
LABEL author="Daniel"


COPY ./packages/editor-sample/package.json ./
COPY ./packages/editor-sample/package-lock.json ./

RUN npm set cache /cache/.npm
RUN npm install

COPY . ./

WORKDIR /packages/editor-sample/

RUN pwd

RUN npm run build

FROM caddy:2.8-alpine
COPY Caddyfile /etc/caddy/Caddyfile
RUN pwd
COPY --from=0 /packages/editor-sample/dist /srv/email-builder-js


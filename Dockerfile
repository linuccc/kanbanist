# 1st level
FROM node:14-buster as buildstage
WORKDIR /usr/src/kanbanist
COPY . .
RUN yarn
RUN yarn build

# 2nd level
FROM nginx:alpine as workingstage
COPY --from=buildstage /usr/src/kanbanist/build /usr/share/nginx/html


FROM node:13.4.0-alpine as builder
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
#RUN npm install --production --silent && mv node_modules ./
#RUN npm install --production --silent
RUN npm install -g --production
COPY . .
CMD node_modules/.bin/ng build

FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /usr/src/app/dist/dashboard /usr/share/nginx/html
EXPOSE 4200
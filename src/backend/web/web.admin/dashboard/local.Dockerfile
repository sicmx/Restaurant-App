
# Stage 1
FROM node:13.14.0-alpine as builder
WORKDIR /usr/src/app
COPY package*.json yarn.lock ./
RUN yarn
COPY . ./
RUN yarn build --configuration=local-docker --base-href=/dashboard/ --deploy-url=/dashboard/

# Stage 2
FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /usr/src/app/dist/dashboard /usr/share/nginx/html
EXPOSE 4200

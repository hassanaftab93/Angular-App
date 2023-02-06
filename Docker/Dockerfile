FROM node:16.17 AS build-stage
WORKDIR /app/
COPY package*.json ./package*.json
RUN npm install --only=production
COPY . .
RUN npm run build-prod

# Stage - Production
FROM nginx:alpine as production-stage
RUN rm -rf ./usr/share/nginx/html/*
COPY --from=build-stage /app/dist/angular-app/ /usr/share/nginx/html/
# COPY ./Docker/nginx.conf /etc/nginx/nginx.conf
# EXPOSE 4200
# CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]
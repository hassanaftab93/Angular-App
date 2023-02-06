# Use the official Node.js image as the base image
FROM node:16.17 AS builder

# Set the working directory in the container to /app
WORKDIR /app

# Copy the package.json and package-lock.json to the container
COPY package*.json .

# Install the project dependencies
RUN npm ci --only=production

# Copy the rest of the project files to the container
COPY . .

# Build the Angular project
RUN npm run build-prod

# FROM node:16.17-alpine
# WORKDIR /angular-app
# COPY --from=builder /app/dist/angular-app/ /angular-app/
# COPY package*.json ./
# RUN npm install

FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist/angular-app/ /usr/share/nginx/html/
COPY ./Docker/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# Expose port 4200 to allow access to the Angular app
# EXPOSE 4200

# Specify the command to run when the container starts
# CMD ["npm", "start"]
# Use the official Node.js image as the base image
FROM node:16.17 AS builder

# Set the working directory in the container to /app
WORKDIR /app

# Copy the package.json and package-lock.json to the container
COPY package*.json .

# Install the project dependencies
RUN npm install

# Copy the rest of the project files to the container
COPY . .

# Build the Angular project
RUN npm run build-prod

FROM alpine
WORKDIR /angular-app
COPY --from=builder /app/dist/angular-app/ /angular-app/
#COPY package*.json ./
#RUN npm install
# Expose port 4200 to allow access to the Angular app
EXPOSE 4200

# Specify the command to run when the container starts
CMD ["npm", "start"]

# Generated by https://smithery.ai. See: https://smithery.ai/docs/config#dockerfile
# Use a Node.js 16+ image
FROM node:16-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the application code and build the server
COPY . .
RUN npm run build

# Use a smaller node image for running the app
FROM node:16-alpine

# Set the working directory
WORKDIR /app

# Copy the build and node_modules from the build stage
COPY --from=build /app/build ./build
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package.json ./

# Set the environment variable for the OpenFEC API Key
# This should be set at runtime with -e or --env-file
ENV OPENFEC_API_KEY=your_api_key_here

# Expose the port the app runs on
EXPOSE 3000

# Start the server
ENTRYPOINT ["node", "build/server.js"]

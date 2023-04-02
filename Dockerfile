# Use the official Ubuntu 20.04 LTS image as a base
FROM ubuntu:20.04

# Install required packages
RUN apt-get update && \
    apt-get install -y nodejs npm --no-install-recommends nodejs npm

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

RUN ls /app/public

# Copy the rest of the application
COPY . .

# Install dependencies
RUN npm install

# Build the React app
RUN npm run build

# Install Express
RUN npm install express

# Expose port 3000
EXPOSE 3000

# Start the Express server
CMD ["npm", "start"]

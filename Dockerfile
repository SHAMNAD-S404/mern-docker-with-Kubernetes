# Use a lightweight Node.js image
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Install production dependencies only
COPY package.json /app
RUN npm install
# Switch to a non-root user for security
USER node

# Copy application files
COPY . .

# Expose the necessary ports
EXPOSE 3003 3000

# Start the application
CMD ["npm", "start"]

# Optional: Add a healthcheck 
HEALTHCHECK CMD curl --fail http://localhost:3003/ || exit 1

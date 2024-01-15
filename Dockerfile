# Use the official Node.js 14 base image (for building the React app)
FROM node:14 as build

# Set working directory for the frontend
WORKDIR /usr/src/app/client

# Copy frontend package.json and package-lock.json
COPY ./client/package*.json ./
COPY settings.php service.yml .
# Install frontend dependencies
RUN npm install

# Copy frontend source codee
COPY ./client ./

# Build the React app for production
RUN npm run build

# Use the official Nginx base image (for serving the built React app)
FROM nginx:latest

# Copy the built React app from the build stage to Nginx web server
COPY --from=build /usr/src/app/client/build /usr/share/nginx/html
COPY ./client/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
# Expose the frontend port (if needed)
EXPOSE 80

# Nginx will start automatically
#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

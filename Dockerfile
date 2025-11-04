# Use the official nginx image as base
FROM nginx:alpine

# Copy the website files to nginx's default public directory
COPY . /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# nginx daemon will start automatically, no need for CMD

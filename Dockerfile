# Use the official NGINX base image
FROM nginx:latest

# Remove default NGINX config
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom NGINX config into the container
COPY nginx.conf /etc/nginx/nginx.conf

# Optional: Copy static website files (like HTML, CSS, JS)
COPY html/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]


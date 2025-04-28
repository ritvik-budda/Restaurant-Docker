# Use a specific version of Nginx Alpine for better stability
FROM nginx:1.25-alpine

# Add labels for maintainability
LABEL maintainer="Ritvik Budda ritvik.budda@gmail.com"
LABEL description="Restaurant Website Container"

# Remove the default Nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy your static website files to Nginx's html directory
COPY --chown=nginx:nginx . /usr/share/nginx/html

# Set proper permissions
RUN chmod -R 755 /usr/share/nginx/html

# Configure Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Add health check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:80/ || exit 1

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

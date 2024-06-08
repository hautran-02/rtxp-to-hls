# Use a base image with FFmpeg pre-installed
FROM jrottenberg/ffmpeg:latest

# Copy shell script for converting RTMP to HLS
COPY convert.sh /usr/local/bin/convert.sh

# Allow execution of shell script
RUN chmod +x /usr/local/bin/convert.sh

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Create directory for HLS files
RUN mkdir -p /usr/share/nginx/html/hls

# Expose ports for Nginx
EXPOSE 80
EXPOSE 443

# Start FFmpeg and Nginx
RUN /usr/local/bin/convert.sh
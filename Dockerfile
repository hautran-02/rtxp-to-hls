# Use an appropriate base image
FROM alpine:latest

# Install FFmpeg
RUN apk add --no-cache ffmpeg

# Set up a directory for storing HLS output
WORKDIR /app

# Copy the script to convert RTMP to HLS
COPY convert_rtmp_to_hls.sh .

# Make the script executable
RUN chmod +x convert_rtmp_to_hls.sh

# Command to run the script
CMD ["./convert_rtmp_to_hls.sh"]
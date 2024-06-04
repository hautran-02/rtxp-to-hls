FROM jrottenberg/ffmpeg:4.4-scratch

# Copy shell script for converting RTMP to HLS
COPY ./ffmpeg_convert.sh /usr/local/bin/convert.sh

RUN chmod +x /usr/local/bin/convert.sh
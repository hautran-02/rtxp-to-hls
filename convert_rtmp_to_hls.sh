#!/bin/bash

# Example array of RTMP streams
rtmp_streams=(
    "rtmp://103.130.211.150:10050/stream"
    "rtmp://103.130.211.150:10050/stream"
    # Add more RTMP streams as needed
)

# Convert each RTMP stream to HLS
for rtmp_stream in "${rtmp_streams[@]}"
do
    ffmpeg -i "$rtmp_stream" -c:v libx264 -preset veryfast -g 60 -hls_time 2 -hls_list_size 5 -hls_wrap 10 /app/hls/$(basename "$rtmp_stream").m3u8
done

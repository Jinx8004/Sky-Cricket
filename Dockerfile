FROM alfg/nginx-rtmp
RUN apk add --no-cache ffmpeg bash
COPY nginx.conf /etc/nginx/nginx.conf

CMD ["bash", "-c", "\
mkdir -p /tmp/hls && \
ffmpeg -re -i 'http://centra.ink/live/Centra_Live_iVIOT/zTsGiHyZ884M/437270.m3u8' \
-map 0:v:0 -map 0:a:0 -c:v copy -c:a aac -b:a 128k -ac 2 -ar 44100 \
-f flv rtmp://localhost/live/stream & \
nginx -g 'daemon off;'"]

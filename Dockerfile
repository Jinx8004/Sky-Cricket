FROM alfg/nginx-rtmp
COPY nginx.conf /etc/nginx/nginx.conf
RUN apk add --no-cache ffmpeg bash

CMD ["bash", "-c", "\
ffmpeg -re -i 'http://centra.ink/live/Centra_Live_iVIOT/zTsGiHyZ884M/437270.m3u8' \
-map 0:v:0 -map 0:a:0 -c:v copy -c:a aac -b:a 128k -ar 44100 -ac 2 \
-f flv rtmp://localhost/live/sky & \
nginx -g 'daemon off;'"]

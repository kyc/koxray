FROM alpine:edge

ARG AUUID="03272f17-1244-4b62-9260-079af0557896"
ARG CADDYIndexPage="https://github.com/AYJCSGM/mikutap/archive/master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget
    
RUN chmod +x /deploy.sh
CMD /deploy.sh

RUN chmod +x /start.sh
CMD /start.sh

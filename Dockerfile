FROM ghcr.io/open-webui/open-webui:main

COPY sync_data.sh sync_data.sh
COPY nginx.conf	nginx.conf



run mkdir -p /var/lib/nginx && chmod 777 /var/lib/nginx
run mkdir -p /var/log &&  chmod 777 /var/log
RUN  mkdir -p /etc/nginx && mkdir -p /var/run &&  chmod 777 -R /var && chmod 777 -R /etc/nginx && chmod 777 -R /var/run
run mkdir -p /var/log/nginx
run touch /var/log/nginx/access.log && chmod 777 /var/log/nginx/access.log
run chmod 777 /var/log/nginx

RUN apt update && \
    apt install -y nginx

RUN chmod -R 777 ./data && \
    chmod -R 777 ./open_webui && \
    sed -i "1r sync_data.sh" ./start.sh  


FROM nginx:alpine

# Odstranění výchozího obsahu Nginx
RUN rm -rf /usr/share/nginx/html/*

# Kopírování vlastní bezpečné Nginx konfigurace
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Kopírování webu do kořene Nginxu
COPY . /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

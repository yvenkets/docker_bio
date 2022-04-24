FROM nginx
WORKDIR /usr/share/nginx/html/
COPY web/* /usr/share/nginx/html/
EXPOSE 80

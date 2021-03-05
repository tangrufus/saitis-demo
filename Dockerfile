FROM nginx:alpine

COPY build /app/build/
COPY .htpasswd /app/

COPY nginx.conf /etc/nginx/nginx.conf.template

CMD /bin/sh -c "envsubst '\$PORT' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf" && nginx

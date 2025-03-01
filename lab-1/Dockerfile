FROM alpine

RUN apk add --no-cache nginx && mkdir -p /var/www /var/log/nginx /var/lib/nginx && chown -R nginx:nginx /var/lib/nginx /var/log/nginx /run/nginx

EXPOSE 80

USER nginx

CMD ["nginx", "-g", "daemon off;"]
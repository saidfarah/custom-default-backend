FROM nginx:alpine

# Remove default NGINX Config
RUN rm /etc/nginx/nginx.conf && \
    rm /etc/nginx/conf.d/default.conf && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# NGINX Config
COPY custom-backend/etc/nginx.conf /etc/nginx/nginx.conf
COPY custom-backend/etc/default.conf /etc/nginx/conf.d/default.conf

# Resources
COPY custom-backend/content/ /var/www/html/

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
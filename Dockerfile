FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get install -y nginx php8.1-fpm
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/
RUN rm -rf /var/www/html/*
COPY index.php /var/www/html
RUN chown -R www-data:www-data /var/www/
RUN sed -i 's/^listen = .*/listen = localhost:9000/' /etc/php/8.1/fpm/pool.d/www.conf
EXPOSE 80
CMD service php8.1-fpm start && nginx -g "daemon off;"

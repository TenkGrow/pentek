FROM Dockerfile/ubuntu

RUN
  sudo apt-get install software-properties-common \
  && add-apt-repository -y ppa:nginx/stable \
  && pt-get update \
  && pt-get install -y nginx \
  && rm -rf /var/lib/apt/lists/* \
  && echo "\ndaemon off;" >> /etc/nginx/nginx.conf \
  && chown -R www-data:www-data /var/lib/nginx

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

WORKDIR /etc/nginx

CMD ["nginx"]

EXPOSE 80
EXPOSE 443

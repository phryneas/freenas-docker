FROM ubuntu:16.04

RUN apt-get update -qq
RUN apt-get install -qy git  
RUN apt-get install -qy lighttpd php7.0-common php7.0-fpm  
RUN apt-get install -qy php7.0-curl php7.0-dom php7.0-xml php7.0-sqlite php7.0-json php7.0-gmp php7.0-mbstring php7.0-iconv php7.0-zip

RUN rm -r /var/www/html
RUN git clone https://github.com/FreshRSS/FreshRSS.git /var/www/html
RUN chown www-data:www-data /var/www/html
RUN rm -r /var/www/html/data
RUN mkdir /var/www/html/data 

ADD lighttpd-php-fpm.conf /etc/lighttpd/conf-enabled/
ADD ./run.sh /opt/

LABEL org.freenas.interactive="false" \
      org.freenas.version="0.1" \
      org.freenas.upgradeable="false" \
      org.freenas.expose-ports-at-host="true" \
      org.freenas.autostart="true" \
      org.freenas.web-ui-protocol="http" \
      org.freenas.web-ui-port=81 \
      org.freenas.web-ui-path="" \
      org.freenas.port-mappings="80:81/tcp" \
      org.freenas.volumes="[						\
          {								\
              \"name\": \"/var/www/html/data\",				\
              \"descr\": \"FreshRSS data folder\"				\
          }								\
      ]"

EXPOSE 80
VOLUME ["/var/www/html/data"]

CMD ["/opt/run.sh"]

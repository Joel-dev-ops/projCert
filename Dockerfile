FROM devopsedu/webapp

ADD proj /var/www/html/

RUN rm /var/www/html/index.html

EXPOSE 80

CMD apachectl -D FOREGROUND

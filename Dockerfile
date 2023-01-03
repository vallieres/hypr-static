FROM httpd:latest

RUN sed -i 's/#LoadModule rewrite_module/LoadModule rewrite_module/g' /usr/local/apache2/conf/httpd.conf
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /usr/local/apache2/conf/httpd.conf

RUN apachectl -k restart
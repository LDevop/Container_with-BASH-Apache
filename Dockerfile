FROM httpd:latest
ENV DOMAIN_NAME ""
RUN apt-get update && apt-get install dnsutils -y
COPY index.html /usr/local/apache2/htdocs/
COPY lookup.sh /usr/local/bin/
CMD ["sh", "-c", "/usr/local/bin/lookup.sh $DOMAIN_NAME && httpd-foreground"]
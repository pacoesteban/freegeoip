FROM alpine:latest

ADD /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY cmd/freegeoip/public /var/www
COPY ./build/GeoLite2-City.mmdb.gz /tmp/default_db.gz

ADD ./build/freegeoip /freegeoip
RUN adduser -D -s /bin/ash freegeoip

USER freegeoip
ENTRYPOINT ["/freegeoip"]
CMD ["-db", "/tmp/default_db.gz"]

EXPOSE 8080

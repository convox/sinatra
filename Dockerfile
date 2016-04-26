FROM alpine:3.2

RUN apk update 
RUN apk add build-base curl-dev ruby-dev zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev postgresql-dev mysql-dev
RUN apk add nodejs yaml
RUN apk add ruby ruby-bundler ruby-io-console ruby-json ruby-nokogiri
RUN apk add nginx

WORKDIR /app

RUN bundle config --global build.nokogiri "--use-system-libraries"

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY bin/web /app/bin/web

CMD ["bin/web"]

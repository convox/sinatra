FROM alpine:3.2

RUN apk update && apk add \
  build-base curl-dev ruby-dev zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev postgresql-dev mysql-dev \
  ruby ruby-io-console ruby-json ruby-nokogiri yaml nodejs

RUN apk add nginx ruby-bundler

WORKDIR /app

RUN bundle config --global build.nokogiri "--use-system-libraries"

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY bin/web /app/bin/web

CMD ["bin/web"]

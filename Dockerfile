FROM convox/ruby

RUN apk update 
RUN apk add nginx

ENV PORT 5000

COPY bin/web /app/bin/web
COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["bin/web"]

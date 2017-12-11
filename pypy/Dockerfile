FROM pypy:2

MAINTAINER Indy Beck

RUN pip install gunicorn gevent graphite-api[sentry,cyanite] statsd scandir Flask-Cache && \
    pip install git+https://github.com/swoop-inc/graphouse-graphite-api.git@mb_initial

COPY graphite-api.yaml /etc/graphite-api.yaml

VOLUME /srv/graphite
EXPOSE 8000

CMD exec gunicorn graphite_api.app:app -b 0.0.0.0:8000 -w 9

FROM python:3.6.2-jessie

MAINTAINER Indy Beck

RUN pip install gunicorn graphite-api[sentry,cyanite] statsd scandir Flask-Cache

#ONBUILD ADD graphite-api.yaml /etc/graphite-api.yaml
#ONBUILD RUN chmod 0644 /etc/graphite-api.yaml
COPY graphouse/graphouse_api.py /usr/local/lib/python3.6/site-packages/graphite_api/finders/graphouse_api.py

VOLUME /srv/graphite
EXPOSE 8000

ENTRYPOINT exec gunicorn -b 0.0.0.0:8000 --log-level debug graphite_api.app:app
CMD -w 2

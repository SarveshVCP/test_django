#!/usr/bin/env bash
# start-server.sh
(python3 manage.py migrate)
(python3 manage.py collectstatic --noinput)
(gunicorn demo_django.wsgi --user www-data --bind 0.0.0.0:8000 -w 4 --worker-class gevent --timeout 120)
# nginx -g "daemon off;"
#!/usr/bin/env bash

python manage.py collectstatic --noinput
python manage.py migrate --noinput
python -m gunicorn --bin 0.0.0.0:8000 --worker 3 backend.wsgi

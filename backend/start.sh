#!/usr/bin/env bash
set -o errexit

python manage.py migrate
python esg.py
gunicorn config.wsgi:application

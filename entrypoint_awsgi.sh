#!/bin/bash

echo "Starting..."

echo "Migarating the database..."
python3 manage.py migrate --no-input


echo "Collecting static files..."
python3 manage.py collectstatic --noinput

#echo "Starting the server..."
#[ ! -z "$GUNICORN_WORKERS" ] || $GUNICORN_WORKERS=4
gunicorn doosma.wsgi:application  --bind 0.0.0.0:8000

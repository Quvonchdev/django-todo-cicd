#!/bin/bash
apt update
apt install python3-pip python3-dev libpq-dev postgresql postgresql-contrib nginx curl
pip install django==3.2
python manage.py migrate
python3 manage.py runserver
#!/bin/bash
apt update
pip install django==3.2
python manage.py migrate
python3 manage.py runserver
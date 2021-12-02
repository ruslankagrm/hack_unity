FROM python:3.9

COPY . /srv/www/unity
WORKDIR /srv/www/unity

RUN pip install -r requirements.txt

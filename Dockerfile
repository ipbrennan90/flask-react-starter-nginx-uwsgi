FROM tiangolo/uwsgi-nginx-flask:python3.6

COPY ./portfolio.conf /etc/nginx/conf.d
COPY ./app /app


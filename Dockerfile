FROM tiangolo/uwsgi-nginx-flask:python3.6

COPY ./portfolio.conf /etc/nginx/conf.d
COPY ./app /app
RUN apt-get update && \
    apt-get -y install sudo
RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && sudo apt-get install -y nodejs
WORKDIR /app/static
RUN npm install
RUN npm run build

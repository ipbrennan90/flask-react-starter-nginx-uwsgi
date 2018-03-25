FROM tiangolo/uwsgi-nginx-flask:python3.6

COPY ./portfolio.conf /etc/nginx/conf.d
COPY ./app /app

WORKDIR /app
RUN apt-get update && \
    apt-get -y install sudo
RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && sudo apt-get install -y nodejs
COPY ./static/package.json /app/static/package.json
WORKDIR /app/static
RUN npm install
COPY ./static/.env /app/static/.env
COPY ./static/js /app/static/js
COPY ./static/webpack.config.js /app/static/webpack.config.js
COPY ./static/.babelrc /app/static/.babelrc
COPY ./static/assets /app/static/assets
COPY ./static/index.html /app/static/index.html
RUN npm run build

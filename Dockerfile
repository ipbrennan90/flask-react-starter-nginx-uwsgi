FROM tiangolo/uwsgi-nginx-flask:python3.6
COPY ./www.ian-brennan.com.conf /etc/nginx/conf.d
COPY ./app /app
WORKDIR /static
RUN apt-get update && apt-get -y install sudo
RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && sudo apt-get install -y nodejs
RUN apt-get install -y --only-upgrade python && apt-get install -y python-pip
RUN sudo apt-get install build-essential libssl-dev libffi-dev python-dev && pip install certbot-nginx
RUN sudo certbot --nginx -d ian-brennan.com -d www.ian-brennan.com
COPY ./static/package.json /static/package.json
RUN npm install --only=production
COPY ./static/.env /static/.env
COPY ./static/js /static/js
COPY ./static/webpack.config.js /static/webpack.config.js
COPY ./static/.babelrc /static/.babelrc
COPY ./static/assets /static/assets
COPY ./static/index.html /static/index.html
RUN npm run build
WORKDIR /app

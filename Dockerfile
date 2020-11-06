FROM '123majumundur/php-7.1-nginx:cicd'
LABEL maintaner-"muhammadrifqifr99@gmail.com"

# install prestissimo for faster deps installation
RUN composer global require hirak/prestissimo

# make directory for hosting app
RUN mkdir /home/app/app
WORKDIR /home/app/app

# install dependencies
COPY composer.json composer.json
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader && rm -rf /home/app/.composer

# copy codebase
COPY -chown=app:root . ./

#finish composer
# RUN composere dump-autoload
RUN composer dump.autoload --no-scripts --no-dev --optimize

EXPOSE 8080

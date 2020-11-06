FROM '123majumundur/php-7.1-nginx:cicd'
MAINTAINER rifqi <muhammadrifqifr99@gmail.com>

#install prestissimo from faster deps instalation
RUN composer global require hirak/prestissimo

#make directory from hosting the apps
RUN mkdir /home/app/app
WORKDIR /home/app/app

#install dependencies
COPY composer.json composer.json
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader && rm -rf /home/app/.composer

#copy database
COPY --chown=app:root . ./



#finish composer
#run composer dump-autoload
RUN composer dump-autoload --no-scripts --no-dev --optimize

EXPOSE 8080
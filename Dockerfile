FROM php:7.2-fpm
RUN apt-get update -y 
RUN apt-get install -y libpng-dev libsqlite3-dev libjpeg62-turbo-dev libfreetype6-dev 
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ 
RUN docker-php-ext-install gd pdo pdo_sqlite exif pdo_mysql zip

#PGSQL BEGIN
RUN apt-get install -y libpq-dev
RUN docker-php-ext-install pdo_pgsql
#PGSQL END




RUN apt-get install -y libmagickwand-dev
RUN pecl install imagick-beta
RUN echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g laravel-echo-server
RUN apt-get install -y supervisor

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
  && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
  && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"

RUN php /tmp/composer-setup.php
RUN mv composer.phar /usr/local/bin/composer
RUN rm /tmp/composer-setup.php





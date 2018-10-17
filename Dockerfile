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




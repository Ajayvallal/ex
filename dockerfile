#use the official php image as the base image
FROM php:7.4-apache
#Copy the appalication files into the container
COPY ./var/www/html
#set the working directory in the container
WORKDIR /var/www/html
#Install necessary PHP extensions
RUN apt-get update && apt-get install-y \
    libicu-dev \
    libzip-dev \
    && docker-php-ext-install \
    int1 \
    zip \
    && a2enod rewriter

#expose port 80
EXPOSE 80
#Define the entry point for the container
CMD ["appache2-forground"]

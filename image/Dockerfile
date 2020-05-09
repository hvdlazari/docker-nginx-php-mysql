# OS
FROM amazonlinux:2018.03

# Owner
LABEL key="Hellen Lazari <hellen.lazari@gmail.com>"

# TIMEZONE
RUN echo "ZONE=\"America/Sao_Paulo\"" | tee --append "/etc/sysconfig/clock"
RUN ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime

# Volume
VOLUME /var/www/application

# Expose Ports
EXPOSE 80 443 9000

# /root/.bashrc
RUN echo "alias ll='ls -alh --color'" | tee --append "/root/.bashrc";

# Update and Upgrade
RUN yum -y update && yum -y upgrade

# Install Basic
RUN yum install -y git curl vim htop wget gcc

# Install Nginx Server
RUN yum install -y nginx
RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# Install PHP 7.0
RUN yum install -y \
    php70-opcache \
    php70-gd \
    php70-intl \
    php70-json \
    php70-mbstring \
    php70-mcrypt \
    php70-mysqlnd \
    php70-pdo \
    php70-soap \
    php70-xml \
    php70-zip \
    php70-xmlrpc \
    php70-pecl-igbinary \
    php70-pecl-imagick \
    php70-pecl-oauth \
    php70-pecl-uuid \
    php70-pecl-memcached \
    php70 \
    php70-cli \
    php70-fpm

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');";
RUN php 'composer-setup.php';
RUN php -r "unlink('composer-setup.php');";
RUN mv 'composer.phar' '/usr/bin/composer';

# Clean Install
RUN yum clean all

# Start Container
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x "./usr/local/bin/docker-entrypoint.sh"
ENTRYPOINT ["./usr/local/bin/docker-entrypoint.sh"]

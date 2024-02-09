ARG VERSION=1 
FROM debian:12

RUN apt update && apt install wget apache2 php8.2 libapache2-mod-php8.2 -y ; apt clean ; a2enmod php8.2
RUN <<EOF
wget https://raw.githubusercontent.com/malec0101/devops-hometasks/main/01-vagrant/2/000-default.conf ; \
head -18 000-default.conf > /etc/apache2/sites-available/000-default.conf ; \
rm /var/www/html/index.html ; wget https://raw.githubusercontent.com/malec0101/devops-hometasks/main/01-vagrant/2/index.php ; \
cat index.php > /var/www/html/index.php ; \
chown www-data:www-data /var/www/html/* ; \
rm 000-default.conf index.php ; service apache2 restart ; \
apt purge wget -y
EOF
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

#!/bin/bash
clear

echo -ne "\033[1;32m => SENHA MYSQL: \033[1;37m"; read -r senha

if [ -z "$senha" ]; then
   echo "Senha vazia, defina uma senha valida!"
   exit 1
fi

echo "America/Sao_Paulo" > /etc/timezone
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime > /dev/null 2>&1
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1

apt update
apt upgrade -y
apt install apache2 unzip cron curl -y
apt install libssh2-1-dev libssh2-1 -y
apt install php libapache2-mod-php php-mysql php-curl php-ssh2 php-mbstring -y
apt install mariadb-server -y

cd /usr/share
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip
unzip phpMyAdmin-latest-all-languages.zip
mv phpMyAdmin-*-all-languages phpmyadmin
rm phpMyAdmin-latest-all-languages.zip
chmod -R 0755 phpmyadmin
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
mkdir -p /usr/share/phpmyadmin/tmp
chown -R www-data /usr/share/phpmyadmin/tmp
chmod -R 775 /usr/share/phpmyadmin/tmp

mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$senha' WITH GRANT OPTION; FLUSH PRIVILEGES;"

cat /dev/null > ~/.bash_history && history -c
systemctl restart apache2
systemctl restart mysql

rm *
clear

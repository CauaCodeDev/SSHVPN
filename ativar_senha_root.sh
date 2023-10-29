#!/bin/bash
clear
sudo -i

echo -ne "\033[1;32mDigite sua nova senha root\033[1;37m: "; read senha

 $(grep -c "prohibit-password" /etc/ssh/sshd_config) != '0'  && {
	sed -i "s/prohibit-password/yes/g" /etc/ssh/sshd_config
} > /dev/null
 $(grep -c "without-password" /etc/ssh/sshd_config) != '0'  && {
	sed -i "s/without-password/yes/g" /etc/ssh/sshd_config
} > /dev/null
 $(grep -c "#PermitRootLogin" /etc/ssh/sshd_config) != '0'  && {
	sed -i "s/#PermitRootLogin/PermitRootLogin/g" /etc/ssh/sshd_config
} > /dev/null
 $(grep -c "PasswordAuthentication" /etc/ssh/sshd_config) = '0'  && {
	echo 'PasswordAuthentication yes' > /etc/ssh/sshd_config
} > /dev/null
 $(grep -c "PasswordAuthentication no" /etc/ssh/sshd_config) != '0'  && {
	sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
} > /dev/null
 $(grep -c "#PasswordAuthentication no" /etc/ssh/sshd_config) != '0'  && {
	sed -i "s/#PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
} > /dev/null

service ssh restart > /dev/null

iptables -F
iptables -A INPUT -p tcp --dport 81 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 8799 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 1194 -j ACCEPT

echo "root:$senha" | chpasswd
clear

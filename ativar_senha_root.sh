#!/bin/bash
clear

if [ "$(id -u)" -ne 0 ]; then
  echo "Este script precisa ser executado como root."
  exit 1
fi

echo -ne "\033[1;32mDigite a nova senha para o usuário root: \033[1;37m"
read -s senha
echo

if [ -z "$senha" ]; then
   echo "A senha não pode estar vazia. Por favor, forneça uma senha válida."
   exit 1
fi

echo "root:$senha" | chpasswd

if grep -q "#PermitRootLogin" /etc/ssh/sshd_config; then
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
fi

if ! grep -q "PasswordAuthentication yes" /etc/ssh/sshd_config; then
    sed -i 's/PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
fi

systemctl restart ssh

iptables -F
iptables -A INPUT -p tcp --dport 81 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 8799 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 1194 -j ACCEPT
clear

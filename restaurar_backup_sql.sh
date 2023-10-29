#!/bin/bash
clear

echo -ne "\nSENHA DO MySQL: "; read passdb
echo -ne "\nDATABASE DO MySQL: "; read datadb

mysql -h localhost -u root -p"$passdb" -e "show databases" | grep -wc "$datadb"
mysql -h localhost -u root -p"$passdb" -e "drop database $datadb"
mysql -h localhost -u root -p"$passdb" -e "CREATE DATABASE $datadb"
mysql -h localhost -u root -p"$passdb" --default_character_set utf8 "$datadb" < *.sql
clear

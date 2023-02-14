#!/bin/bash


# 	script básico para criação automática de uma infraestrutura de usuários, 
#	grupos de usuários, diretórios e permissões.



declare -A users

# Criação de diretórios

mkdir /home/Adm
mkdir /home/Public


# Dicionário de usuários

users=( ["Paula"]="Adm" ["Ana"]="Public" ["João"]="Public" ["Flávia"]="Public")



# Loop para criar usuários e grupos

for i in "${!users[@]}"; do
  useradd "$i" -s /bin/bash -p $(openssl passwd -scrypt senha123) -e
  groupadd "${users[$i]}"
  usermod -a -G "${users[$i]}" "$i" 
done


# Atribuição de permissões aos diretórios

chgrp Adm /home/Adm
chmod 750 /home/Adm

chgrp Public /home/Public
chmod 750 /home/Public


#!/bin/bash

echo "Boas vindas, que o seu tempo aqui seja radiante!"
echo "Inicializando sistema, aguarde..."

echo "Criando Grupos..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando Diretórios..."

mkdir -v -m 777 /home/publico
mkdir -v -m 770 /home/adm /home/ven /home/sec

chown -v root:GRP_ADM /home/adm
chown -v root:GRP_VEN /home/ven
chown -v root:GRP_SEC /home/sec

echo "Criando Usuários..."

useradd -s /bin/bash -m -G GRP_ADM -p $(openssl passwd -6 senhaadm) carlos
useradd -s /bin/bash -m -G GRP_ADM -p $(openssl passwd -6 senhaadm) maria
useradd -s /bin/bash -m -G GRP_ADM -p $(openssl passwd -6 senhaadm) joao
useradd -s /bin/bash -m -G GRP_VEN -p $(openssl passwd -6 senhaven) debora
useradd -s /bin/bash -m -G GRP_VEN -p $(openssl passwd -6 senhaven) sebastiana
useradd -s /bin/bash -m -G GRP_VEN -p $(openssl passwd -6 senhaven) roberto
useradd -s /bin/bash -m -G GRP_SEC -p $(openssl passwd -6 senhsec) josefina
useradd -s /bin/bash -m -G GRP_SEC -p $(openssl passwd -6 senhsec) amanda
useradd -s /bin/bash -m -G GRP_SEC -p $(openssl passwd -6 senhsec) rogerio

echo "Sistema Pronto para uso, aproveite!!!"

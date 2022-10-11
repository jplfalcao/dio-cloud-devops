#!/usr/bin/env bash
# Autor: João Falcão
# Github: https://github.com/jplfalcao
# Decrição: Provisionamento do manager.
# Data de criação: 10/10/2022 
# Data de modificação:
# Versão: 1.0

#Função para criar os diretórios e adicionar as permissões.
function addDir () {

	sudo mkdir -p /public/{database,webserver}
	sudo chmod 1755 /public

}

#Função que instala o servidor nfs e compartilha os diretórios criados.
function installNfs () {

	sudo apt-get update && sudo apt-get install nfs-kernel-server -y
	sudo echo -e "/public/database/\t\t *(rw,sync,subtree_check)" | sudo tee -a /etc/exports
	sudo echo -e "/public/webserver/\t\t *(rw,sync,subtree_check)" | sudo tee -a /etc/exports
	sudo exportfs -ar
	sudo systemctl restart nfs-kernel-server

}

#Função que cria o Banco de Dados.
function createDatabase () {

	sudo docker run -e MYSQL_ROOT_PASSWORD=rootpasswd -e MYSQL_DATABASE=devops \
	--name marydatabse -d -p 3306:3306 --mount type=bind,src=/public/database/,dst=/var/lib/mysql/ mariadb

}

#Função que cria o Servidor Web
Função que cria um servidor Web.
function createServiceWebServer () {

	sudo docker service create --name webserver --replicas 10 -dt -p 80:80 --mount type=bind,src=/public/webserver/,dst=/usr/local/apache2/htdocs/ httpd

}

#Função para adicionar as regras no firewall.
function rulesIptables () {

	sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
	sudo iptables -A INPUT -p tcp --dport 2049 -j ACCEPT
	sudo iptables -A INPUT -p tcp --dport 3306 -j ACCEPT

}


#Chamando as funções.

addDir

installNfs

createDatabase

createServiceWebServer

rulesIptables

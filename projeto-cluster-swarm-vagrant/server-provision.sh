#!/usr/bin/env bash
# Autor: João Falcão
# Github: https://github.com/jplfalcao
# Decrição: Provisionamento dos workers.
# Data de criação: 10/10/2022 
# Data de modificação:
# Versão: 1.0

#Função para criar os diretórios e adicionar as permissões.
function addDir () {

	sudo mkdir -p /public/{database,webserver}
	sudo chmod 1755 /public

}

#Função que instala o cliente nfs e monta os compartilhamentos.
function installNfs () {

	sudo apt-get update && sudo apt-get install nfs-common -y
	sudo mount -t nfs 192.168.56.100:/public/database/ /public/database
	sudo mount -t nfs 192.168.56.100:/public/webserver/ /public/webserver

}

#Chamando as funções.
addDir

installNfs

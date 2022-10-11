#!/usr/bin/env bash
# Autor: João Falcão
# Github: https://github.com/jplfalcao
# Decrição: Criando um token para adicionar os workers ao nó.
# Data de criação: 10/10/2022 
# Data de modificação:
# Versão: 1.0

sudo docker swarm init --listen-addr=192.168.56.100:2377 --advertise-addr=192.168.56.100:2377
sudo docker swarm join-token worker | sudo tee /vagrant/servers_token

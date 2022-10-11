#!/usr/bin/env bash
# Autor: João Falcão
# Github: https://github.com/jplfalcao
# Decrição: Adicionando os workers ao nó.
# Data de criação: 10/10/2022 
# Data de modificação:
# Versão: 1.0

sudo docker swarm join --token $(cat /vagrant/servers_token) 192.168.56.100:2377

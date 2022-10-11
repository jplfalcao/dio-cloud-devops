#!/usr/bin/env bash
# Autor: João Falcão
# Github: https://github.com/jplfalcao
# Decrição: Instalando o Docker Engine e adicionando o usuário vagrant ao grupo docker.
# Data de criação: 10/10/2022 
# Data de modificação:
# Versão: 1.0

sudo apt-get update && sudo apt-get install ca-certificates curl gnupg lsb-release -y

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sudo usermod -aG docker vagrant

#!/usr/bin/env bash
# Autor: João Falcão
# Github: https://github.com/jplfalcao
# Decrição: Criando um deploy de uma aplicação php e mariadb com 1 cluster, 3 nós e 9 replicas , utilizando o GCP. 
# Data de criação: 24/10/2022 
# Data de modificação:
# Versão: 1.0

log="$PWD/$(echo $0 | cut -d'/' -f2).log"

echo -e "Iniciando o procedimento!
Criando a imagem do backend..."
sleep 5
docker build -t jplfalcao/project-backend:1.0 backend/. &>> "$log"
echo -e "Imagem criada com sucesso!\n"

echo "Criando a imagem do banco de dados..."
sleep 5
docker build -t jplfalcao/project-database:1.0 database/. &>> "$log"
echo -e "Imagem criada com sucesso!\n"

echo "Subindo as imagens para o Docker Hub!"
sleep 5
# Necessário realizar o login com a credencial.
# Utilize o comando: docker login.
docker push jplfalcao/project-backend:1.0 &>> "$log"
docker push jplfalcao/project-database:1.0 &>> "$log"
echo -e "Imagens enviadas para o Docker Hub com sucesso!\n"

echo "Criando os servidos no Cluster..."
sleep 5 
kubectl apply -f services.yml &>> "$log"
echo -e "Serviços criados com sucesso!\n"

echo "Criando o volume persistente..."
sleep 5
kubectl apply -f pvc.yml &>> "$log"
echo -e "Volume criado com sucesso!\n"

echo "Criando os deployments..."
sleep 5
kubectl apply -f deployment.yml &>> "$log"
echo -e "Deployments criados com sucesso!
Procedimento finalizado!"
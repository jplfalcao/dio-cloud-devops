# Criando um deploy utilizando Kubernets.
Para esse projeto foi utilizado o Google Cloud Platform (GCP) como provedor de serviço.
Na plataforma foi criado um cluster com trés nós utilizando a opção Free Tier.

O projeto possui códigos para uma aplicação ```php``` e um banco de dados ```mariadb``` como backend.
O frontend estará isolado do cluster onde o ```LoadBalancer``` irá fazer o envio das requisições para dos pods, armazenando os dados em um volume persistente (pvc).

-------------------------

Comandos utilizados para consulta:
```
kubectl get pods -o wide
```
```
kubectl get services -o wide
```
```
kubectl get deployment -o wide
```
```
kubectl get pv -o wide
```

------------------------

Documentação consultada:

https://cloud.google.com/kubernetes-engine/docs/concepts/persistent-volumes#dynamic_provisioning

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

https://kubernetes.io/docs/concepts/services-networking/service/

https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy

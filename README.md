# Introduction 
Criação de container para aplicação PHP com banco de dados MySQL

## Getting Started
1.	Instalação e Configuração do Docker
2.	Construção dos Containers
3.	Configurar a Aplicação
---
Os comandos abaixo são comando para configuração em um Linux OS.

## 1. Instalação e Configuração do Docker
Para instalar o docker siga as instruções do site [Docker](https://www.docker.com/community-edition#/download).

### 1.2. Criar Virtual Private Network (VPN)
Criar VPN para comunicação entre os containers. __Antes de executar o comando verifique se a VPN já existe!__

```bash
$ sudo docker network create \
  --driver=bridge \
  --subnet=172.18.0.0/16 \
  --ip-range=172.18.0.0/16 \
  --gateway=172.18.0.1 \
  localhost
```

---
## 2. Construção dos Containers

### 2.1. Criar Imagem para Ambiente
Execute os comandos abaixo para criar a imagem para container da aplicação.

```bash
$ sudo docker build --tag "myapplication/dev:202001" "${HOME}/myworkspace/myapplication/docker/image"
$ sudo docker images
```

### 2.2. Container para Aplicação
Execute os comandos abaixo para criar o container para Aplicação.

```bash
$ sudo docker run \
    --net "localhost" \
    --ip "172.18.1.1" \
    --name "kroton-ava-kls" \
    --volume "${HOME}/myworkspace/myapplication":/var/www/application \
    --tty --interactive myapplication/dev:202001
```

### 2.3. Criar Container para o Banco de Dados (Caso você precise?!)
Comando para criar o [Container(s)](https://www.docker.com/what-container) da aplicação.
```bash
$ sudo docker run \
    --net "localhost" \
    --ip "172.18.1.2" \
    --name "database-mysql" \
    --env "MYSQL_ROOT_PASSWORD=root" \
    --volume "/etc/localtime":"/etc/localtime" \
    --detach "mysql:5.7"
```

## 3. Configurar o virtual host da Aplicação

Adicione as linhas abaixo no "/etc/hosts".

```text
# Docker 
172.18.1.1 dev.myapplication.com
```

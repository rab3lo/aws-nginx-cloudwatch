# Provisionamento de Servidor Nginx com Monitoramento na AWS

Este projeto consiste na criação de uma instância EC2 na AWS com o servidor web Nginx instalado, junto com a configuração do CloudWatch para monitoramento básico de métricas como CPU e memória. A instalação é automatizada por meio de um script em Bash.

## Tecnologias utilizadas

- Amazon EC2 (Amazon Linux 2)
- Nginx
- Amazon CloudWatch Agent
- Shell Script (Bash)

## Objetivo

O objetivo deste projeto é demonstrar conhecimentos práticos em provisionamento de infraestrutura na AWS, configuração de serviços, monitoramento básico e automação de processos com scripts.

## Passos principais do projeto

1. Criar uma instância EC2 (t2.micro, Amazon Linux 2)
2. Conectar via SSH na instância
3. Instalar e configurar o Nginx
4. Instalar e configurar o agente do CloudWatch
5. Automatizar os passos acima com um script em Bash
6. Validar o funcionamento do Nginx via navegador
7. Verificar as métricas coletadas no CloudWatch

## Como usar

Com sua instância EC2 (Amazon Linux 2) já criada e acessível, siga os passos abaixo:

### 1. Acesse a instância via SSH

bash
ssh -i "sua-chave.pem" ec2-user@<IP-da-instância>

### 2. Clone o repositório

git clone https://github.com/rab3lo/aws-nginx-cloudwatch.git
cd aws-nginx-cloudwatch/scripts

### 3. Dê permissão de execução para o script setup-nginx-monitoring.sh

chmod +x setup-nginx-monitoring.sh

### 4. Execute o script de configuração

./setup-nginx-monitoring.sh

O script realiza automaticamente:

Instalação e ativação do Nginx

Instalação e configuração do CloudWatch Agent

Início do monitoramento de uso de memória e disco

### 5. Verificação

Acesse o IP público da instância para verificar o Nginx em funcionamento

No console da AWS, vá para CloudWatch > Métricas > e veja os dados sendo enviados

## Estrutura do projeto
```
aws-nginx-cloudwatch/
├── scripts/
│ ├── setup-nginx-monitoring.sh
|  └── amazon-cloudwatch-agent.yaml  
├── images/
│ └── nginx-browser.png
│ └── cloudwatch-metrics.png
├── README.md
```

## Monitoramento com CloudWatch

1. Instalação CloudWatch Agent

Para coletar métricas personalizadas da instância EC2, utilizei o CloudWatch Agent, configurado por meio do wizard interativo.

A configuração foi salva em:

/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.yaml

Depois, iniciei o agente com o comando::

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a start -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.yaml -s

Após isso, criei um dashboard no CloudWatch com os principais gráficos do tipo "medidor" para:

CPU Utilization
Network In
Network Out

Segue a imagem do dashboard:

![Dashboard CloudWatch](images/cloudwatch-metrics.png)


#!/bin/bash

# Atualiza os pacotes do sistema
sudo yum update -y

# Instala o Nginx via amazon-linux-extras
sudo amazon-linux-extras install nginx1 -y

# Inicia o serviço do Nginx
sudo systemctl start nginx

# Habilita o Nginx para iniciar automaticamente
sudo systemctl enable nginx

# Instala o CloudWatch Agent
sudo yum install -y amazon-cloudwatch-agent

# Cria o diretório de configuração
sudo mkdir -p /opt/aws/amazon-cloudwatch-agent/etc/

# Copia o arquivo de configuração do CloudWatch Agent para a pasta
sudo cp /home/ec2-user/aws-nginx-cloudwatch/scripts/amazon-cloudwatch-agent.yaml /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.yaml

# Inicia o CloudWatch Agent com a configuração
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a start \
  -m ec2 \
  -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.yaml \
  -s

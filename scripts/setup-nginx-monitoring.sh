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

# Copia o arquivo de configuração
sudo cp amazon-cloudwatch-agent.yaml /opt/aws/amazon-cloudwatch-agent/etc/

# Inicia o CloudWatch Agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
-a start \
-m ec2 \
-c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.yaml \
-s


# Salve com permissão de execução
chmod +x setup-nginx-monitoring.sh

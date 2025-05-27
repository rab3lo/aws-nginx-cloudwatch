#!/bin/bash

# Atualiza os pacotes do sistema
sudo yum update -y

# Instala o Nginx via amazon-linux-extras
sudo amazon-linux-extras install nginx1 -y

# Inicia o serviço do Nginx
sudo systemctl start nginx

# Habilita o Nginx para iniciar automaticamente
sudo systemctl enable nginx

# Salve com permissão de execução
chmod +x setup-nginx-monitoring.sh

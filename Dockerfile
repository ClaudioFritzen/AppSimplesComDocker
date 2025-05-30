# Usa uma imagem oficial do Python
FROM python:3.10-slim

# Atualiza os pacotes do sistema para corrigir vulnerabilidades
RUN apt-get update && apt-get upgrade -y && apt-get clean

# Define o diretório de trabalho no container
WORKDIR /app

# Copia os arquivos para o container
COPY . .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# Expõe a porta usada pela aplicação
EXPOSE 5000

# Comando para rodar o app
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "app"]

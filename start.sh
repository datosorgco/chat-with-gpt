#!/bin/bash

# Detener el contenedor actual 
CONTAINER_ID=$(docker ps | grep openchat | awk '{print $1}')
docker stop $CONTAINER_ID

# Actualizar el código fuente
git pull

# Reconstruir la imagen
docker build -t openchat .

# Ejecutar nuevo contenedor 
docker run -v $(pwd)/data:/app/data -d -p 8081:3000 openchat:latest > log.txt
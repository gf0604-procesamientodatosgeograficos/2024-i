# Se utiliza la imagen rocker/geospatial:4.3.3 como base
FROM rocker/geospatial:4.3.3

# Se define la variable de entorno PASSWORD
ENV PASSWORD=gf0604

# Se descarga e instala el paquete quarto del sistema operativo
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.551/quarto-1.4.551-linux-amd64.deb && \
    apt-get install -y ./quarto-1.4.551-linux-amd64.deb && \
    rm quarto-1.4.551-linux-amd64.deb

# Se limpia el cache de apt-get para reducir el tamaño de la imagen
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Se expone el puerto por defecto de RStudio Server
EXPOSE 8787

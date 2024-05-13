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

# Instalación del paquete here de R, versión 1.0.1
RUN R -e "devtools::install_version('here', version = '1.0.1', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete DT de R, versión 0.32
RUN R -e "devtools::install_version('DT', version = '0.32', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete plotly de R, versión 4.10.4
RUN R -e "devtools::install_version('plotly', version = '4.10.4', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete leaflet.extras de R, versión 1.0.0
RUN R -e "devtools::install_version('leaflet.extras', version = '1.0.0', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete titanic de R, versión 0.1.0
RUN R -e "devtools::install_version('titanic', version = '0.1.0', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete paswr2 de R, versión 1.0.5
RUN R -e "devtools::install_version('PASWR2', version = '1.0.5', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete palmerpenguins de R, versión 0.1.1
RUN R -e "devtools::install_version('palmerpenguins', version = '0.1.1', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete gapminder de R, versión 1.0.0
RUN R -e "devtools::install_version('gapminder', version = '1.0.0', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete ggthemes de R, versión 5.1.0
RUN R -e "devtools::install_version('ggthemes', version = '5.1.0', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete hrbrthemes de R, versión 0.8.7
RUN R -e "devtools::install_version('hrbrthemes', version = '0.8.7', repos = 'http://cran.us.r-project.org')"


# Se limpia el cache de apt-get para reducir el tamaño de la imagen
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Se expone el puerto por defecto de RStudio Server
EXPOSE 8787

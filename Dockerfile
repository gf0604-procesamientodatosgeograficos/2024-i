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

# Instalación del paquete janitor de R, versión 2.2.0
RUN R -e "devtools::install_version('janitor', version = '2.2.0', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete rgbif de R, versión 3.7.9
RUN R -e "devtools::install_version('rgbif', version = '3.7.9', repos = 'http://cran.us.r-project.org')"

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

# Instalación del paquete crhexgrids de R (parece que no maneja versiones)
RUN R -e "devtools::install_github('ManuelSpinola/crhexgrids')"

# Se limpia el cache de apt-get para reducir el tamaño de la imagen
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Se expone el puerto por defecto de RStudio Server
EXPOSE 8787

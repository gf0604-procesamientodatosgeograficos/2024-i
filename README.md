```bash
# Carga de la imagen rocker/geospatial
docker pull rocker/geospatial

# Ejecución del contenedor
docker run -d --name gf0604-2024-i \
  -p 8787:8787 \
  -v /home/mfvargas/gf0604-procesamientodatosgeograficos/2024-i/github:/home/rstudio \
  -e PASSWORD=gf0604 \
  rocker/geospatial

# Acceso al contenedor
http://localhost:8787
```
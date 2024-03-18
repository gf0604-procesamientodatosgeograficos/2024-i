# GF0604 Procesamiento de datos geoespaciales 2024-i

## Contenedor Docker

### Construcción y ejecución
```shell
# Construcción del contenedor Docker
docker build -t gf0604-2024-i .

# Ejecución del contenedor Docker
# (el directorio local debe especificarse en la opción -v)
docker run -d --name gf0604-2024-i \
  -p 8787:8787 \
  -v /home/mfvargas/gf0604-desarrollosigweb/2024-i/github:/home/rstudio \
  -e PASSWORD=gf0604 \
  gf0604-2024-i
```
  
### Acceso
[http://localhost:8787](http://localhost:8787)

### Detención y borrado
```shell
# Detención del contenedor Docker
docker stop gf0604-2024-i

# Borrado del contenedor Docker
docker rm gf0604-2024-i
```

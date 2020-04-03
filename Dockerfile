# Descargamos la imagen de Ubuntu y le asignamos un titulo
FROM dockerfile/Ubuntu AS mongo-server

# Comando a ejecutar: actualizamos el sistema, instalamos mongoDB y eliminamos los archivos de dependencias para evitar actualizaciones automaticas
RUN apt-get update && apt-get install -y mongodb-org && rm -rf /var/lib/apt/lists/*

# Definimos el directorio que competiremos con el SO Host
VOLUME [ "/data/db" ]

# Definimos nuestro directorio de trabajo
WORKDIR /data

# Definimos el comando mongod para ejecutar el servidor de mongo en cuanto se inicie el contenedor
CMD [ "mongod" ]

# Definimos los puertos de conexion
#   -27017: process
#   -28017: http
EXPOSE 27017
EXPOSE 28017

# Definimos datos del creador
MAINTAINER borisvargaspaucara@gmail.com
# Usar una imagen base ligera de Node.js
FROM node:lts-alpine

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiar los archivos de definición de dependencias
# Se copia tanto package.json como package-lock.json (si existe)
COPY package*.json ./

# Instalar las dependencias del proyecto
# Usamos 'npm ci' si existiera package-lock.json para builds más fiables,
# pero 'npm install' es seguro para este boilerplate inicial.
RUN npm install --production

# Copiar el resto del código de la aplicación
COPY . .

# Exponer el puerto en el que corre la aplicación (coincide con config default)
EXPOSE 3000

# Definir el comando para arrancar la aplicación
CMD ["npm", "start"]

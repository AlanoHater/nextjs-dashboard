# Usar la imagen oficial de Node.js
FROM node:20-alpine

# Directorio de trabajo en el contenedor
WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto de la aplicación
COPY . .

# Puerto en el que corre la app
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["npm", "start"]

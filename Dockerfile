# 1. Kiindulási image
FROM node:18-alpine

# 2. Munkakönyvtár a konténerben
WORKDIR /app

# 3. Package fájlok másolása
COPY package*.json ./

# 4. Függőségek telepítése
RUN npm install

# 5. Összes többi fájl bemásolása
COPY . .

# 6. Az alkalmazás portja
EXPOSE 8080

# 7. A konténer indulásakor futtatandó parancs
CMD ["npm", "start"]
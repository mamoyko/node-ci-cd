FROM node:16-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run test

COPY . .

RUN npm run build

EXPOSE 8080

CMD [ "node", "dist/main" ]



# FROM node:alpine AS development

# WORKDIR /usr/src/app

# COPY package*.json ./

# RUN npm install

# COPY . .

# RUN npm run build

# FROM node:alpine AS production 

# ARG NODE_ENV=production
# ENV NODE_ENV=${NODE_ENV}

# WORKDIR /usr/src/app

# COPY package*.json ./

# RUN npm install --only=prod

# COPY . .

# COPY --from=development /usr/src/app/dist ./dist

# CMD [ "node", "dist/main" ]

#ENV PORT=8080

#EXPOSE 8080

#CMD ["npm", "start"]
FROM node:alpine as builder 
WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# everything we need will now be in /app/build

FROM nginx 
# copy something from the builder phase
COPY --from=builder /app/build /usr/share/nginx/html
FROM node:20-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --omit=dev
COPY . .
ENV WATCH_SECONDS=0
ENV AUTO_PUSH=0
EXPOSE 8080
CMD ["sh","-c","node -e \"require('http').createServer((_,r)=>{r.writeHead(200);r.end('ok')}).listen(8080)\" & exec node src/index.js"]

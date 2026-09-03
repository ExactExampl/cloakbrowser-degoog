FROM node:22-slim
RUN apt-get update && apt-get install -y \
  libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 \
  libxkbcommon0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 \
  libgbm1 libpango-1.0-0 libcairo2 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 \
  libasound2 libx11-6 libxext6 libxss1 libdbus-1-3 libnspr4 \
  ca-certificates --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY package.json .
RUN npm install
COPY server.js .
EXPOSE 3000
CMD ["node", "server.js"]


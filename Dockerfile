# Lightweight Node.js environment
FROM node:20-slim

WORKDIR /usr/src/app

COPY package*.json ./

# Include only runtime dependencies
RUN npm install --production

COPY . .

EXPOSE 5090

# Run as a non-root user
RUN useradd -m appuser
USER appuser

CMD [ "node", "start" ]
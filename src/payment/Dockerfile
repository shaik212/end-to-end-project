FROM node:22-alpine
WORKDIR /app
COPY src/payment/package.json src/payment/package-lock.json ./
RUN npm ci --omit=dev
COPY src/payment/ ./
COPY pb/demo.proto ./
ENV PAYMENT_PORT=50051
EXPOSE 50051
USER node
CMD ["node", "--require", "./opentelemetry.js", "index.js"]


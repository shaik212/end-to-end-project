FROM golang:1.22.9-alpine AS builder
WORKDIR /app
COPY src/product-catalog/go.mod src/product-catalog/go.sum ./
RUN go mod download
COPY src/product-catalog ./
RUN go build -ldflags "-s -w" -o /product-catalog .

FROM alpine:3.20
RUN adduser -D appuser
COPY --from=builder /product-catalog /product-catalog 
COPY --from=builder /app/products ./products
USER appuser
ENV PRODUCT_CATALOG_PORT=3550
EXPOSE 3550
ENTRYPOINT ["/product-catalog"]
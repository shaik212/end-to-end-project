FROM golang:1.22.9-alpine AS builder 
WORKDIR /app
COPY src/checkout/go.mod src/checkout/go.sum ./
RUN go mod download
COPY src/checkout ./
RUN go build -ldflags "-s -w" -o /checkout .

FROM alpine:3.20
RUN adduser -D appuser
COPY --from=builder /checkout /checkout
ENV CHECKOUT_PORT=5050
EXPOSE 5050
USER appuser
ENTRYPOINT ["/checkout"]

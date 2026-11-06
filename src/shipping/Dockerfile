FROM rust:1.82.0-alpine AS builder
WORKDIR /app
RUN apk add --no-cache protobuf-dev protoc musl-dev
COPY src/shipping/Cargo.toml src/shipping/Cargo.lock ./
COPY src/shipping ./
COPY pb/demo.proto /app/proto/demo.proto
RUN cargo build --release --features dockerproto

FROM alpine:3.20
RUN adduser -D appuser
COPY --from=builder /app/target/release/shipping /shipping
ENV SHIPPING_PORT=50050
EXPOSE 50050
USER appuser
ENTRYPOINT ["/shipping"]
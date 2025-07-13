FROM alpine:latest AS builder
RUN apk add --no-cache git
RUN git clone https://github.com/oliviertremblaynoel/manual-connections.git

FROM ubuntu:latest

RUN apt-get update ; \
    apt-get install -y \
        wireguard-tools \
        curl \
        iproute2 \
        jq \
        transmission-cli ;

COPY --from=builder /manual-connections /app
WORKDIR /app
CMD ["/app/run_setup.sh"]

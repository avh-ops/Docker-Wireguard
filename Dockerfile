    # Choose a base image (e.g., Alpine Linux for a lightweight image)
    FROM alpine:latest

    # Install WireGuard and necessary tools
    # RUN apk add --no-cache wireguard-tools iproute2
    RUN
      echo "**** install dependencies ****" && \
      apk add --no-cache \
    bc \
    coredns \
    grep \
    iproute2 \
    iptables \
    ip6tables \
    iputils \
    kmod \
    libcap-utils \
    libqrencode-tools \
    net-tools \
    nftables \
    openresolv \
    wireguard-tools && \
  echo "wireguard" >> /etc/modules 
    # Copy your WireGuard configuration files (optional, can be mounted later)
    # COPY wg0.conf /etc/wireguard/wg0.conf

    # Expose the WireGuard UDP port (default is 51820)
    EXPOSE 51820/udp

    # Set the entrypoint or command to start WireGuard
    CMD ["wg-quick", "up", "wg0"]

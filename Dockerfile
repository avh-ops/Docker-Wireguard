    # Choose a base image (e.g., Alpine Linux for a lightweight image)
    FROM alpine:latest

    # Install WireGuard and necessary tools
    RUN apk add --no-cache wireguard-tools iproute2

    # Copy your WireGuard configuration files (optional, can be mounted later)
    COPY wg0.conf /etc/wireguard/wg0.conf

    # Expose the WireGuard UDP port (default is 51820)
    EXPOSE 443/udp

    # Set the entrypoint or command to start WireGuard
    CMD ["wg-quick", "up", "wg0"]

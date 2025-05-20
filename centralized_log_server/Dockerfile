FROM balabit/syslog-ng:latest

RUN apt update && apt install -y sudo iputils-ping net-tools net-tools

# Create a directory for logs
RUN mkdir -p /var/log/syslog-ng

# Copy the syslog-ng configuration file
COPY syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

# Expose syslog ports for client logs
EXPOSE 513/udp 513/tcp 514/udp 514/tcp 515/udp 515/tcp 516/udp 516/tcp 517/udp 517/tcp 518/tcp 518/udp 519/tcp 519/udp

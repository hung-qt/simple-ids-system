FROM ubuntu:22.04

# Install SSH server
RUN apt update && apt install -y openssh-server syslog-ng sudo iputils-ping net-tools

# Create the required directory
RUN mkdir -p /run/sshd
RUN mkdir -p /var/log/syslog-ng && touch /var/log/syslog-ng/client.log


# Set a root password (for testing only, use keys in production)
RUN echo 'root:password' | chpasswd

# Enable SSH login (optional security settings)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Start SSH daemon
CMD service ssh start && syslog-ng -F --no-caps

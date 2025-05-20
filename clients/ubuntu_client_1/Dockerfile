FROM ubuntu:22.04

# Install SSH, logging tools, and auditd
RUN apt update && apt install -y openssh-server syslog-ng sudo iputils-ping net-tools auditd

# Setup SSH
RUN mkdir -p /run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Create users
RUN for user in "alice" "bob" "charlie"; do \
        useradd -m -s /bin/bash "$user" && \
        echo "$user:$user" | chpasswd; \
    done

# Enable auditing of all executed commands
RUN echo "-a always,exit -F arch=b64 -S execve -k command_exec" >> /etc/audit/rules.d/audit.rules

# Start SSH, syslog-ng, and auditd
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
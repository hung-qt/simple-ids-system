FROM nginx:latest

RUN apt update && apt install -y openssh-server syslog-ng sudo net-tools

# RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY data/ /usr/share/nginx/html/

# Create the required directory
RUN mkdir -p /run/sshd && chmod 0755 /run/sshd

RUN mkdir -p /var/log/syslog-ng && touch /var/log/syslog-ng/syslog.log
RUN mkdir -p /var/log/syslog-ng && touch /var/log/syslog-ng/ssh.log
RUN mkdir -p /var/log/syslog-ng && touch /var/log/syslog-ng/nginx_access.log
RUN mkdir -p /var/log/syslog-ng && touch /var/log/syslog-ng/nginx_error.log

# Set a root password (for testing only, use keys in production)
RUN echo 'root:password' | chpasswd

# Enable SSH login (optional security settings)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Start SSH daemon
# CMD ["nginx", "-g", "daemon off;"]
# CMD ["/usr/sbin/sshd", "-D"]

CMD /usr/sbin/sshd && syslog-ng -F --no-caps & nginx -g 'daemon off;'
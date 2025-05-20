#!/bin/bash
service ssh start
service syslog-ng start
# service auditd start

echo "Starting auditd..."
# auditd -f
auditctl -R /etc/audit/rules.d/audit.rules

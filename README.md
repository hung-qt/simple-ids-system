# 🐳 Centralized Logging Stack with ELK + Syslog-NG (Dockerized)

![Docker](https://img.shields.io/badge/dockerized-yes-blue?logo=docker)
![Elastic Stack](https://img.shields.io/badge/Elastic-8.17.2-blue?logo=elasticsearch)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-experimental-orange)

A centralized log aggregation stack using **Elasticsearch**, **Logstash**, **Kibana**, and **Syslog-NG**, designed to collect and analyze logs from virtual machines (VMs).

---

## 📚 Table of Contents

- [Project Setup](#-project-setup)
- [Requirements](#-requirements)
- [Getting Started](#-getting-started)
- [Kibana Log Patterns](#-kibana-log-patterns)
- [Known Issues](#-known-issues)
- [Credentials](#-credentials-env)
- [License](#-license)

---

## 📦 Project Setup

> ✅ Tested on **Docker Desktop (Windows)** — for other OSes, additional IP configuration may be needed.

This project enables centralized log monitoring and processing by:
- Collecting logs from client machines via Syslog-NG.
- Sending logs to Logstash and indexing them in Elasticsearch.
- Visualizing data with Kibana dashboards.

---

## 🛠 Requirements

- Docker & Docker Compose
- VMWare (Client VM in **NAT mode**)
- Basic familiarity with networking and log systems

---

## 🚀 Getting Started

### Step 1: Configure Syslog-NG on the Client VM

Inside your client VM:

```bash
sudo nano /etc/syslog-ng/syslog-ng.conf
```

Update the destination IP:
- Locate the IP `192.168.64.1`
- Replace it with your **VMware NAT gateway IP** (find via `ipconfig` on host)

### Step 2: Import VM and Login

- Import the provided VM image into VMware
- Set the VM network mode to NAT
- Default credentials:  
  `Username: client1`  
  `Password: client1`

### Step 3: Start the Logging Stack

From the project folder on the host:

```bash
docker-compose up setup
docker-compose build
docker-compose up -d
```

Once containers are running, access Kibana:

🔗 [http://localhost:5601](http://localhost:5601)  
👤 Login: `elastic`  
🔑 Password: `elastic1111`

---

## 📊 Kibana Log Patterns

To observe logs in Kibana, use the following index patterns:

- `syslog-*`
- `auth-*`
- `ssh-*`
- `kernel-*`
- `daemon-*`
- `auditd-*`
- `local-*`

> ⏱ Logs may take some time to appear depending on system activity.

---

## 🐞 Known Issues

- `centralized_log_server` container may become overloaded after prolonged use.
- Kibana visualizations are not yet predefined.
- Alerting features are not configured.
- AppArmor is not yet enabled for protecting log data.

---

## 🔒 Credentials (.env)

Refer to `.env` for all stack user credentials.

---

## 📜 License

This project is licensed under the [MIT License](./LICENSE).

# Apache APISIX Project

This repository provides scripts and configuration to set up **Apache APISIX**, **etcd**, and the **APISIX Dashboard** on Ubuntu using Docker and shell automation.

It includes troubleshooting images, installer scripts, and service unit files for running APISIX as a systemd service.

---

## 📂 Project Structure

* `install_docker.sh` → Installs Docker and Docker Compose.
* `install_etcd.sh` → Deploys etcd as the config store for APISIX.
* `install_apisix.sh` → Pulls and runs APISIX.
* `install_apisix_dashboard.sh` → Sets up the APISIX Dashboard.
* `install_nodejs.sh`, `install_yarn.sh`, `install_go.sh` → Installs dependencies for building or extending APISIX.
* `start_apisix.sh` → Script to start APISIX with etcd and dashboard.
* `apisix_dashboard.service`, `apisix_service.sh` → Systemd service files for APISIX and the dashboard.
* `images/` → Error screenshots, fixes, and references.
* `README.MD` → Documentation.

---

## ⚙️ Prerequisites

* Ubuntu 20.04+
* sudo privileges

Run the setup step by step:

### 1. Install Docker

```bash
install_docker.sh
```

### 2. Install etcd

```bash
install_etcd.sh
```

Verify:

```bash
curl http://127.0.0.1:2379/version
```

### 3. Install APISIX

```bash
install_apisix.sh
```

APISIX listens on:

* `9080` (HTTP)
* `9443` (HTTPS)

### 4. Install APISIX Dashboard

```bash
install_apisix_dashboard.sh
```

Access the dashboard at:

```
http://localhost:9000
```

Default login:

* Username: `admin`
* Password: `admin`

---

## ▶️ Starting APISIX

Run everything at once:

```bash
start_apisix.sh
```

---

## 🛠 Example: Add a Route

Run a test upstream:

```bash
docker run -d --name httpbin -p 8080:80 kennethreitz/httpbin
```

Add a route:

```bash
curl http://127.0.0.1:9180/apisix/admin/routes/1 \
  -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" \
  -X PUT -d '{
    "uri": "/get",
    "upstream": {
      "type": "roundrobin",
      "nodes": {
        "httpbin:80": 1
      }
    }
  }'
```

Test it:

```bash
curl http://127.0.0.1:9080/get
```

---

## 📊 Troubleshooting

* Logs:

  ```bash
  docker logs dashboard
  ```

* Increase open file limits (common issue): see `images/file-limit-err.png` and `images/fix.png`.

* Lua, Yarn, NodeJS dependency issues: refer to `images/error-lua.png`.

---

## Notes

> You can use APISIX API Gateway as a traffic entrance to process all business data. It offers features including dynamic routing, dynamic upstream, dynamic certificates, A/B testing, canary release, blue-green deployment, limit rate, defense against malicious attacks, metrics, monitoring alarms, service observability, service governance, and mor

### Installation

These are some of the ways to install Apisix:

* Docker
* RPM
* Helm
* DEB
* Source Code

### Deployment Modes

APISIX has three different deployment modes for different production use cases.

1. Traditional - Data plane and control plane are deployed together. enable_admin attribute should be disabled manually.

2. Decoupled - Data plane and control plane are deployed independently.

3. Standalone - The data_plane mode loads configuration from a local YAML / JSON file, while the traditional mode expects configuration through Admin API.

----

## 📚 References

* [Apache APISIX Docs](https://apisix.apache.org/docs/apisix/getting-started/)
* [APISIX Dashboard](https://github.com/apache/apisix-dashboard)
* [etcd](https://etcd.io/)
# APISIX

> You can use APISIX API Gateway as a traffic entrance to process all business data. It offers features including dynamic routing, dynamic upstream, dynamic certificates, A/B testing, canary release, blue-green deployment, limit rate, defense against malicious attacks, metrics, monitoring alarms, service observability, service governance, and mor

## Installation

- Docker
- RPM
- Helm
- DEB
- Source Code

## Deployment Modes

APISIX has three different deployment modes for different production use cases.

1. Traditional - Data plane and control plane are deployed together. enable_admin attribute should be disabled manually.

2. Decoupled - Data plane and control plane are deployed independently.

3. Standalone - The data_plane mode loads configuration from a local YAML / JSON file, while the traditional mode expects configuration through Admin API.

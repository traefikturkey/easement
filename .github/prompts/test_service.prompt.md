---
description: 'Test new service to the Easement project with a Docker Compose file'
mode: agent
---

# VS Code Copilot Prompt: Test a Service

## Purpose and steps
Test a Docker Compose service in the Easement project using Makefile automation. This prompt will:
- Start the service with `make start-${input:service_name}`
- Wait 30 seconds for startup then dump logs with `sleep 30 && make logdump-${input:service_name}`
- Stop and handle any errors after each step before continuing

## Input Fields
- `service_name`: The name of the service to test (e.g., `n8n`, `pocketbase`).

---

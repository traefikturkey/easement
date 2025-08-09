---
description: 'Add a new service to the Easement project with a Docker Compose file'
mode: agent
---

# Add Service to Easement Project

This prompt will guide you through adding a new service to the Easement project using the `/add_service` command. The agent will:

1. Research the latest official Docker setup for the specified service
2. Create a step-by-step plan using the rules and examples in `copilot-instructions.md` combined with the remaining steps defined in this file, and then follow that plan to completion
3. Create a production-ready Compose file at `compose/${input:service_name}.yml`
4. Ensure compatibility with Makefile patterns and project conventions
5. Follow best practices (no `version:` label, sensible environment variables, proper volumes, ports, health checks, restart policies)

## Service to Add: ${input:service_name:Enter the service name (e.g., redis, mongodb, elasticsearch)}

## Reference Files
- [Copilot Instructions](../copilot-instructions.md) - Contains project guidelines
- [Existing N8N Service](../../compose/n8n.yml) - Example service configuration
- [Existing PocketBase Service](../../compose/pocketbase.yml) - Another example
- [Project Makefile](../../Makefile) - To understand the service management patterns

## Expected Output
A complete, working Compose file that follows project conventions and can be managed using Makefile commands:
- `make start-${input:service_name}`
- `make run-${input:service_name}`
- `make down-${input:service_name}`
- `make logs-${input:service_name}`



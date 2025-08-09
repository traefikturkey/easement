# Easement Copilot Prompts

## add_service.prompt.md

This prompt enables you to quickly add a new Docker Compose service to the Easement project using GitHub Copilot Chat in VS Code.

### Features
- **Input Field**: Prompts for a service name (e.g., redis, mongodb, elasticsearch)
- **Autonomous Agent**: Researches the latest official Docker setup for the service
- **Compose File Creation**: Generates a production-ready `compose/<service_name>.yml` file
- **Project Conventions**: Follows Easement's best practices and Makefile patterns
- **No Deprecated Version Label**: Ensures the `version:` label is omitted per project rules
- **References**: Points to existing service files and project instructions for consistency

### How to Use
1. Open Copilot Chat in VS Code
2. Run the `/add_service <service_name>` prompt or select it from the prompt files
4. The agent will research, generate, and add the new compose file for you

### Example
To add a Redis service:
- Run the prompt  `/add_service redis` as the service name
- The agent will create `compose/redis.yml` with a robust, production-ready configuration
- Manage the service using Makefile commands: `make start-redis`, `make logs-redis`, etc.

---
For more details, see the main [README.md](./README.md)

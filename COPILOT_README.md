# Easement Copilot Prompts

## [.github/prompts/add_service.prompt.md](.github/prompts/add_service.prompt.md)

This prompt enables you to quickly add a new Docker Compose service to the Easement project using GitHub Copilot Chat in VS Code.

### How to Use
- Open Copilot Chat in VS Code
- Run the `/add_service <service_name>` prompt or select it from the prompt files
- The agent will research, generate, and add the new compose file for you

### Example
To add a Redis service:
- Run the prompt  `/add_service redis` as the service name
- The agent will create `compose/redis.yml` with a robust, production-ready configuration
- Manage the service using Makefile commands: `make start-redis`, `make logs-redis`, etc.

### Features
- **Input Field**: Prompts for a service name (e.g., redis, mongodb, elasticsearch)
- **Autonomous Agent**: Researches the latest official Docker setup for the service
- **Compose File Creation**: Generates a production-ready `compose/<service_name>.yml` file
- **Project Conventions**: Follows Easement's best practices and Makefile patterns

---
For more details, see the main [README.md](./README.md)

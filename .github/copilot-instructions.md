# Copilot Instructions for Easement

This guide helps future Copilot chats add services and features to the Easement project using the Makefile and Docker Compose setup. Easement works with Docker or Podman and is cross-platform.

## Adding a New Service
1. Create a new Compose file in `compose/<service_name>.yml` for your service.
2. Use the following Makefile targets to manage your service:
   - `make start-<service_name>`: Start the service in detached mode.
   - `make run-<service_name>`: Run the service in the foreground.
   - `make down-<service_name>`: Stop and remove the service.
   - `make restart-<service_name>`: Restart the service.
   - `make logs-<service_name>`: Show logs for the service.
3. For all services at once, use:
   - `make down-all`: Stop all containers defined in every `compose/*.yml` file.
   - `make log-all`: Show logs for all services.
   - `make clean`: Remove all containers, volumes, and images for all services.

## Makefile Patterns
- Pattern rules use `%` to match service names, e.g., `run-%` for `make run-n8n`.
- All service management commands use Docker Compose's `-f` flag to combine multiple service files.
- Usage instructions are shown if you run a target without a service name (e.g., `make run`).

## .gitignore
- The `.gitignore` is configured to ignore all files in `compose/` except for `*.yml` files.

## Troubleshooting
- If a port is already in use, check for running containers or services using that port.
- For cross-platform compatibility, the Makefile detects your OS and whether you have Docker or Podman.

## Example: Adding a Service
1. Add `compose/myservice.yml`.
2. Run `make start-myservice` to start it.
3. Run `make logs-myservice` to view logs.
4. Run `make down-myservice` to stop and remove it.

---
For more details, see the README.md and comments in the Makefile. If you need to add new features or targets, follow the pattern rules and usage instructions shown above.

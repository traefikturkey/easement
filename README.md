
# Easement

Easement is a containerized project managed with Docker Compose and Makefile automation. It provides a flexible way to run, manage, and clean up multiple services using simple `make` commands. The Makefile is cross-platform and detects your OS and whether you are using Docker or Podman.

> **GitHub Copilot Supported:**
> This project is designed to work well with GitHub Copilot for faster development and automation.

## Project Structure
- `compose/`: Contains individual service Compose files (`*.yml`) and related data directories.
- `Makefile`: Automation for building, running, stopping, logging, and cleaning services.

## Makefile Targets

### Service Management
- `make start-<name>`: Start the service defined in `compose/<name>.yml` in detached mode.
- `make run-<name>`: Run the service in the foreground, aborting on container exit.
- `make down-<name>`: Stop and remove the service defined in `compose/<name>.yml`.
- `make restart-<name>`: Restart the service by running `down-<name>` then `start-<name>`.
- `make logs-<name>`: Show logs for the service defined in `compose/<name>.yml`.

### All Services
- `make down-all`: Stop and remove all containers defined in every `compose/*.yml` file.
- `make log-all`: Show logs for all services defined in every `compose/*.yml` file.
- `make clean`: Remove all containers, volumes, and images for all services in every `compose/*.yml` file.

## Adding a new service
1. Place service definitions in `compose/<service_name>.yml`.
2. Use the provided `make` commands to manage your services.
3. For full cleanup, use `make clean`.


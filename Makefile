# https://docs.docker.com/develop/develop-images/build_enhancements/
# https://www.docker.com/blog/faster-builds-in-compose-thanks-to-buildkit-support/
export DOCKER_BUILDKIT := 1
export DOCKER_SCAN_SUGGEST := false
export COMPOSE_DOCKER_CLI_BUILD := 1

# Include .env file if it exists
-include .env
export

# Cross-platform detection
ifeq ($(OS),Windows_NT)
	DETECTED_OS := windows
	SHELL_CMD := powershell
	ifneq (, $(shell where pwsh))
		SHELL_CMD := pwsh
	endif
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		DETECTED_OS := linux
	endif
	ifeq ($(UNAME_S),Darwin)
		DETECTED_OS := macos
	endif
endif


# Host IP detection (simplified for devcontainer)
ifndef HOSTIP
	ifeq ($(DETECTED_OS),linux)
		# In devcontainer/Docker, get the host gateway IP (Docker host)
		HOSTIP := $(shell ip route get 1 | head -1 | awk '{print $$7}' )
	else ifeq ($(DETECTED_OS),macos)
		HOSTIP := $(shell ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $$2}' )
	else ifeq ($(DETECTED_OS),windows)
		HOSTIP := $(shell powershell -noprofile -command '(Get-NetIPConfiguration | Where-Object {$$_.IPv4DefaultGateway -ne $$null -and $$_.NetAdapter.Status -ne "Disconnected"}).IPv4Address.IPAddress' )
	endif
endif

# Container runtime detection
ifndef CONTAINER_RUNTIME
	ifneq (, $(shell which podman 2>/dev/null))
		CONTAINER_RUNTIME := podman
	else
		CONTAINER_RUNTIME := docker
	endif
endif

# Export variables
export HOSTIP
export CONTAINER_RUNTIME
export DETECTED_OS
export SEMANTIC_VERSION

up: run
	
.env:
	touch .env

clean:
	$(CONTAINER_RUNTIME) compose $(foreach file,$(wildcard compose/*.yml),-f $(file)) down --volumes --remove-orphans 
	$(CONTAINER_RUNTIME) compose $(foreach file,$(wildcard compose/*.yml),-f $(file)) rm -f

# Pattern rule: make start <name> uses ./compose/<name>.yml
start:
	@echo "Usage: make start-<name>"

start-%: .env
	$(CONTAINER_RUNTIME) compose --env-file .env -f ./compose/$*.yml up -d


# Pattern rule: make restart <name> uses ./compose/<name>.yml
restart:
	@echo "Usage: make restart-<name>"

restart-%:
	$(CONTAINER_RUNTIME) compose -f ./compose/$*.yml restart

# Pattern rule: make run <name> uses ./compose/<name>.yml
run:
	@echo "Usage: make run <name>"

run-%: .env
	$(CONTAINER_RUNTIME) compose -f ./compose/$*.yml up --force-recreate --abort-on-container-exit --remove-orphans

# Pattern rule: make down <name> uses ./compose/<name>.yml

stop:
	@echo "Usage: make down-<name>"
	@echo "       make down-all (stops all containers defined in compose/*.yml)"

stop-%:
	$(CONTAINER_RUNTIME) compose --env-file .env -f ./compose/$*.yml down

# Stop all running containers for the project using all compose/*.yml files
stop-all:
	$(CONTAINER_RUNTIME) compose $(foreach file,$(wildcard compose/*.yml),-f $(file)) down

# Pattern rule: make logs <name> uses ./compose/<name>.yml
logs:
	@echo "Usage: make logs <name>"

logs-%:
	$(CONTAINER_RUNTIME) compose -f ./compose/$*.yml logs -f

# Dump logs for a service (no tail)
logdump-%:
	$(CONTAINER_RUNTIME) compose --env-file .env -f ./compose/$*.yml logs

# Print logs for all services defined in compose/*.yml
log-all:
	$(CONTAINER_RUNTIME) compose $(foreach file,$(wildcard compose/*.yml),-f $(file)) logs


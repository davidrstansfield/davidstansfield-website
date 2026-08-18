# Simple shortcuts for local Docker-based Jekyll work.
# Run from the repo root:  make <target>
#
# Prerequisites: Docker Desktop

.PHONY: help up down build update-gems serve

help:
	@echo "Targets:"
	@echo "  make update-gems   Refresh gems + rewrite Gemfile.lock (then commit the lockfile)"
	@echo "  make up            Start the site (rebuild image if needed)"
	@echo "  make build         Rebuild the Docker image only"
	@echo "  make down          Stop the site"
	@echo "  make serve         Alias for 'make up'"

# Refresh Gemfile.lock to newest versions allowed by Gemfile.
# Writes the lockfile onto the host via the compose volume mount.
update-gems:
	docker compose run --rm jekyll bundle update

# Start after a Gemfile / Gemfile.lock change (rebuilds image so gems match).
up serve:
	docker compose up --build

build:
	docker compose build

down:
	docker compose down

# Makefile for Arbor Link API

# Docker Commands
docker-up:
	@echo "Starting up Docker containers..."
	docker-compose -f infra/development/docker-compose.yml up

docker-down:
	@echo "Stopping Docker containers..."
	docker-compose -f infra/development/docker-compose.yml down

docker-rebuild:
	@echo "Rebuilding Docker containers..."
	docker-compose -f infra/development/docker-compose.yml down
	docker-compose -f infra/development/docker-compose.yml build
	docker-compose -f infra/development/docker-compose.yml up

docker-setup: docker-rebuild
	@echo "Setting up the database..."
	docker-compose -f infra/development/docker-compose.yml run web rails db:create db:migrate

# Server Commands
start-server:
	@echo "Starting the Rails server..."
	bundle exec rails server

# Database Commands
migrate-db:
	@echo "Running database migrations..."
	bundle exec rails db:migrate

seed-db:
	@echo "Seeding the database..."
	bundle exec rails db:seed

reset-db: migrate-db seed-db

# Test Commands
run-tests:
	@echo "Running tests..."
	bundle exec rspec

.PHONY: docker-up docker-down docker-rebuild docker-setup start-server stop-server migrate-db seed-db reset-db run-tests

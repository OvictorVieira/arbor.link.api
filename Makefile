docker-up:
	docker-compose -f infra/development/docker-compose.yml up

docker-down:
	docker-compose -f infra/development/docker-compose.yml down

migrate-up:
	rails db:migrate

migrate-down:
	rails db:migrate:down

migrate-up-test:
	rails db:migrate RAILS_ENV=test

migrate-down-test:
	rails db:migrate:down RAILS_ENV=test

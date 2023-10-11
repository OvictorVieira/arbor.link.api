<img src="https://img.shields.io/static/v1?label=COVERAGE&message=100&color=green&style=for-the-badge"/> <img src="https://img.shields.io/static/v1?label=Ruby&message=2.7.3&color=red&style=for-the-badge&logo=RUBY"/> <img src="https://img.shields.io/static/v1?label=Ruby%20on%20Rails&message=7.1.0&color=red&style=for-the-badge&logo=Ruby"/>

# Arbor Link API Documentation

## Introduction

Arbor Link API is a robust system designed to manage entities and their relationships. This documentation provides a comprehensive guide on how to set up, use, and contribute to the Arbor Link API.

## Production URL

The live application is deployed on [Heroku](https://www.heroku.com/) and can be accessed at [https://arbor-link-api-22474c398d03.herokuapp.com](https://arbor-link-api-22474c398d03.herokuapp.com). The database is hosted on [Amazon RDS Free Tier](https://aws.amazon.com/pt/rds/free/).

## Table of Contents

1. [Project Structure](#project-structure)
2. [Postman Collection](#postman-collection)
3. [Prerequisites](#prerequisites)
4. [Installation](#installation)
5. [Database Structure](#database-structure)
6. [Usage](#usage)
7. [Endpoints](#endpoints)
8. [Testing](#testing)
9. [Test Coverage](#test-coverage)
10. [Release and Deployment](#release-and-deployment)

## Project Structure

Below is the directory structure of the Arbor Link API:

```
├── app
│   ├── channels
│   │   └── application_cable
│   ├── controllers
│   │   ├── api
│   │   ├── application_controller.rb
│   │   └── concerns
│   ├── exceptions
│   │   ├── create_failure_error.rb
│   │   └── update_failure_error.rb
│   ├── jobs
│   │   └── application_job.rb
│   ├── mailers
│   │   └── application_mailer.rb
│   ├── models
│   │   ├── application_record.rb
│   │   ├── concerns
│   │   ├── entity.rb
│   │   └── user.rb
│   ├── serializers
│   │   ├── entity_serializer.rb
│   │   └── user_serializer.rb
│   ├── services
│   │   └── v1
│   └── views
│       └── layouts
```

This structure provides an organized view of the main components of the application, from controllers and models to serializers and services.

## Postman Collection

To test the API endpoints, you can use the provided Postman collection. [Download the collection here](https://github.com/OvictorVieira/arbor.link.api/files/12862900/arbor.link.api.postman.collection.json) and import it into your Postman application.

To the **local** environment use [localhost:3000](http://localhost:3000) as the `base_url` variable value.

To the **production** environment use [https://arbor-link-api-22474c398d03.herokuapp.com](https://arbor-link-api-22474c398d03.herokuapp.com) as the `base_url` variable value.

## Prerequisites

### ASDF

1. Install `asdf` using the instructions provided [here](https://asdf-vm.com/#/core-manage-asdf).
2. Install the required plugins for Ruby and Node (or any other languages/tools you're using).
3. This project has a file named `.tool-versions` that indicates the ruby version used in it.

### Docker

Ensure you have Docker and Docker Compose installed. If not, follow the installation guides:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/OvictorVieira/arbor.link.api.git
   cd arbor.link.api
   ```

2. **Use `asdf` to Install the Required Versions:**
   ```bash
   asdf install
   ```

3. **Build and Start the Docker Containers:**
   ```bash
   make docker-setup
   ```

## Database Structure

### Entities Table

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| id          | Integer   | Primary Key |
| name        | String    | Entity name |
| entity_type | String    | Type of the entity (e.g., school, network) |
| inep        | String    | INEP code |
| parent_id   | Integer   | Foreign Key to parent entity |

### Users Table

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| id          | Integer   | Primary Key |
| email       | String    | User's email address |
| password_digest | String | Encrypted password |

(Expand upon this table structure with other tables and details as necessary.)

## Usage

- **Configurations:** Ensure all configurations are set correctly in the `config` directory.
- **Starting the Server:** Use `make start-server` to start the server.
- **Stopping the Server:** Use `make stop-server` to stop the server.
- **Using the API:** Use tools like `curl` or Postman to interact with the API.

## Endpoints

- **Entities:**
  - `GET /api/v2/partners/entities/:id`: Fetches a specific entity.
  - `POST /api/v2/partners/entities`: Creates a new entity.
  - `PUT /api/v2/partners/entities/:id`: Updates an existing entity.

## Authentication

The API uses JWT (JSON Web Token) for authentication. To authenticate:

1. Register a new user or log in to get a token.
2. Include the token in the `Authorization` header for subsequent requests.

## Testing

- **Setting Up the Test Environment:** Ensure the test database is set up and migrations are run.
- **Running Tests:** Use `make run-tests` to run the tests.
- **Understanding Test Results:** Review the output of the `rspec` command to understand test results and any failures.

## Test Coverage

At Arbor Link API, we prioritize the quality and reliability of our codebase. To ensure that our application is thoroughly tested, we utilize the `coverage` gem to monitor our test coverage.

### Checking Test Coverage

After running the tests, a coverage report will be generated in the `coverage/` directory. This report provides detailed insights into which parts of the application are covered by tests and which areas might need more attention.

To view the test coverage report:

1. Ensure you have run the tests using the command:
   ```bash
   make run-tests
   ```

2. After the tests have completed, navigate to the `coverage/` directory in the project root.

3. Run the command bellow to see the coverage page:
   ```bash
   open coverage/index.html
   ```

5. Browse through the report to see the coverage statistics and details for each file.

## Release and Deployment

### Publishing via Tags

At Arbor Link API, we believe in structured and organized releases. To ensure consistency and traceability, we use a tag-based release system. This means that every significant change or release of the application is marked with a specific tag, following the [Semantic Versioning](https://semver.org/) convention.

#### How it Works:

1. **Development & Testing:** Once a feature is developed and thoroughly tested, it's merged into the main branch.
2. **Tagging:** Before a release, a new tag is created. This tag represents the version of the application. For example, `v1.0.0`.
3. **Deployment:** Our CI/CD pipeline is triggered by the creation of tags. Once a new tag is pushed, the pipeline automates the deployment process, ensuring that the tagged version of the application is deployed.
4. **Accessing Releases:** You can view all the tags and releases in the "Releases" section of our GitHub repository. Each release will have detailed notes and changes that were introduced in that version.

#### Benefits:

- **Traceability:** Each release is traceable, and you can easily revert to a previous version if needed.
- **Stability:** By releasing through tags, we ensure that only stable and tested features make it to production.
- **Clarity:** Each tag comes with release notes, providing a clear understanding of the changes.

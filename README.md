Great! You've provided the tree structure of your `app` directory. Let's integrate this into the README.

---

# Arbor Link API Documentation

## Introduction

Arbor Link API is a robust system designed to manage entities and their relationships. This documentation provides a comprehensive guide on how to set up, use, and contribute to the Arbor Link API.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Database Structure](#database-structure)
4. [Usage](#usage)
5. [Endpoints](#endpoints)
6. [Testing](#testing)
7. [Project Structure](#project-structure)
8. [Postman Collection](#postman-collection)

## Prerequisites

... (rest of the sections)

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

To test the API endpoints, you can use the provided Postman collection. [Download the collection here](https://github.com/OvictorVieira/arbor.link.api/files/12859259/arbor.link.api.postman.collection.json) and import it into your Postman application.

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

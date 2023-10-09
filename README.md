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

## Prerequisites

### ASDF

1. Install `asdf` using the instructions provided [here](https://asdf-vm.com/#/core-manage-asdf).
2. Install the required plugins for Ruby and Node (or any other languages/tools you're using).
3. This project have a file named `.tool-versions` that indicates the ruby version used in it.

### Docker

Ensure you have Docker and Docker Compose installed. If not, follow the installation guides:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/OvictorVieira/arbor.link.api.git
   cd arbor.link.api
   ```

2. Use `asdf` to install the required versions:
   ```bash
   asdf install ruby 2.7.3
   ```

3. Build and start the Docker containers:
   ```bash
   make docker-up
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

(Expand upon this table structure with other tables and details as necessary.)

## Usage

- Configurations
- Starting the server
- Using the API

## Endpoints

- `GET /api/v2/partners/entities/:id`: Fetches a specific entity.
- `POST /api/v2/partners/entities`: Creates a new entity.
- `PUT /api/v2/partners/entities/:id`: Updates an existing entity.
  
## Testing

- Setting up the test environment
- Running tests
- Understanding test results

This is a more detailed structure. You can expand upon each section based on the specifics of your API and its functionalities. If you have more specific details or sections you'd like to include, please let me know!

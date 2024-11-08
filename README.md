# FAST API BASIC SET UP WITH FASTAPI, DOCKER, POSTGRESQL, ADMINER AND NGINX

## Overview
This project is a web API built with FastAPI and includes an NGINX reverse proxy, a PostgreSQL database, and Adminer for database management. The application is containerized using Docker for easy deployment and scalability. 

## Table of Contents
- [FAST API BASIC SET UP WITH FASTAPI, DOCKER, POSTGRESQL, ADMINER AND NGINX](#fast-api-basic-set-up-with-fastapi-docker-postgresql-adminer-and-nginx)
  - [Overview](#overview)
  - [Table of Contents](#table-of-contents)
    - [Prerequisites](#prerequisites)
    - [Getting Started](#getting-started)
    - [Running the Application](#running-the-application)
    - [Configuration and Environment Variables](#configuration-and-environment-variables)
    - [Making Changes and Editing the Project](#making-changes-and-editing-the-project)
    - [Switching to Production Mode](#switching-to-production-mode)

---

### Prerequisites
- **Docker** and **Docker Compose** installed on your machine.
- Basic knowledge of Docker and Docker Compose commands.

### Getting Started

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/huelight/fastap-basic-setup.git
    cd fastap-basic-setup
    ```

2. **Create a `.env` File**:
   - Duplicate the `.env-example` file to create `.env`:
     ```bash
     cp .env-example .env
     ```
   - Customize the environment variables in `.env` as needed (e.g., `POSTGRES_USER`, `POSTGRES_PASSWORD`, etc.).

3. **Build Docker Images**:
    ```bash
    docker-compose build
    ```

### Running the Application

1. **Start the Containers**:
    ```bash
    docker-compose up -d
    ```
   - This command will start up all the services defined in the `docker-compose.yml` file, including `nginx`, `webapi_app` (FastAPI application), `postgres_db`, and `adminer`.

2. **Access the Services**:
   - **API**: The FastAPI application can be accessed at [http://localhost](http://localhost).
   - **Adminer**: Database management can be accessed at [http://localhost:8080](http://localhost:8080). Use the credentials from your `.env` file to log in.

3. **Check Logs** (Optional):
   - To monitor logs from all containers:
     ```bash
     docker-compose logs -f
     ```

4. **Stop the Containers**:
   - To stop the containers without removing them:
     ```bash
     docker-compose stop
     ```

   - To stop and remove all containers, networks, and volumes:
     ```bash
     docker-compose down
     ```

### Configuration and Environment Variables

The application is configured using environment variables. The `.env-example` file provides a template for the environment variables, which include:

- `POSTGRES_USER`: PostgreSQL username
- `POSTGRES_PASSWORD`: PostgreSQL password
- `POSTGRES_DB`: Name of the PostgreSQL database
- Other variables as needed by the application (add these to the `.env` file).

### Making Changes and Editing the Project

1. **Edit the Code**:
   - You can modify the code within the `app` folder, which contains all FastAPI modules and configurations. Code changes can be made in the API routes, models, and other submodules.

2. **Rebuild the Docker Image** (after code changes):
   - If you make changes to the code, you’ll need to rebuild the Docker images:
     ```bash
     docker-compose up -d --build
     ```

3. **Running Unit Tests**:
   - If you have unit tests in place, you can run them inside the FastAPI container:
     ```bash
     docker-compose exec webapi_app pytest
     ```

4. **Accessing the Container Shell** (Optional):
   - To run commands inside the `webapi_app` container, open a bash shell:
     ```bash
     docker-compose exec webapi_app bash
     ```

### Switching to Production Mode

1. **Configure for Production**:
   - Update environment variables in the `.env` file to secure production settings, such as using a strong `SECRET_KEY` and enabling `DEBUG=False` if applicable.

2. **Set Up HTTPS**:
   - Configure SSL certificates with NGINX for secure HTTPS access. You can use Let's Encrypt for free SSL certificates:
     - Install `certbot` on the host machine.
     - Run certbot for NGINX, following instructions for certificate generation and auto-renewal setup.

3. **Update Docker Compose File**:
   - Adjust the `docker-compose.yml` file as needed. For example:
     - Change `NGINX` ports to map to `443` for HTTPS.
     - Update environment variables for any production-specific configurations.

4. **Run in Detached Mode**:
   - Start containers in the background with:
     ```bash
     docker-compose up -d
     ```

5. **Monitor and Scale** (Optional):
   - Consider using Docker Swarm, Kubernetes, or another orchestration tool for scaling and managing your application in production.

---


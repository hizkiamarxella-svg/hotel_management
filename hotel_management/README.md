# Hotel Management System

## Project Overview
This project is a Hotel Management System built using PHP and MySQL. It helps manage hotel operations, including guests, rooms, reservations, payments, invoices, and services.

## Technologies
- PHP
- MySQL / MariaDB
- Docker
- Docker Compose

## Prerequisites
- Docker Desktop installed and running
- Docker Compose available through Docker Desktop

## How to Run

1. Clone or download this repository.
2. Open a terminal in the project directory containing `compose.yaml`.
3. Build and start the containers:

   ```bash
   docker compose up --build -d
   ```

4. Check container status:

   ```bash
   docker compose ps
   ```

5. Open the application in your browser:

   http://localhost:8080

## Useful Commands

Stop the containers:

```bash
docker compose down
```

View logs:

```bash
docker compose logs
```

Rebuild the application:

```bash
docker compose up --build -d
```

## Database
The application uses a MySQL-compatible database container managed by Docker Compose. Database configuration is defined in `compose.yaml`.

## Notes
- Do not commit real passwords, credentials, or sensitive information.
- Database initialization instructions may depend on the SQL files included in the project.

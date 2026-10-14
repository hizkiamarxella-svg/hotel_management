# Hotel Management System

## Project Overview
A web-based Hotel Management System built with PHP and MariaDB. It helps manage hotel operations, including guests, rooms, reservations, services, invoices, and payments.

## Technologies
- PHP 8.2
- MariaDB 10.11
- Docker
- Docker Compose

## Prerequisites
- Docker Desktop installed and running
- Git, or download access to this repository

## How to Run

1. Clone or download this repository.
2. Open a terminal inside the `hotel_management` project folder containing `compose.yaml`, `Dockerfile`, and `.env.example`.
3. Copy `.env.example` and rename the copy to `.env`.
4. Keep the example credentials for local testing, or replace them with your own local development values.
5. Build and start the application:

   ```bash
   docker compose up --build -d
   ```

6. Check the containers:

   ```bash
   docker compose ps
   ```

7. Open the application at:

   http://localhost:8080

## Useful Commands

Check logs:

```bash
docker compose logs
```

Stop the containers:

```bash
docker compose down
```

## Database
The database is configured through Docker Compose. The `hotel_management.sql` file is mounted as an initialization script and is intended to load the tables and sample data when the database volume is first initialized.

Database initialization scripts run only on a new database volume. Existing database volumes are not automatically reinitialized.

## Troubleshooting
- Make sure Docker Desktop is running.
- Check container status with `docker compose ps`.
- Review errors with `docker compose logs db` and `docker compose logs web`.
- If the database initialization fails, check the SQL syntax and database logs.

## Security
- Use `.env` for local configuration.
- Do not commit real passwords, private keys, or sensitive data.
- The included sample credentials are for local development only.

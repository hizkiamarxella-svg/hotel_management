# Hotel Management System

## 1. Project Overview

The Hotel Management System is a web-based application built to manage hotel operations.

### Main Features
- Guest management
- Room management
- Reservation management
- Hotel services
- Invoices and payments

## 2. Technology Stack

- PHP 8.2
- Apache
- MySQL-compatible database (MariaDB 10.11 in the Docker configuration)
- Docker
- Docker Compose

## 3. Prerequisites

- Docker Desktop installed and running
- Git, or the ability to download the repository as a ZIP file

The project was built using Docker Desktop with the `php:8.2-apache` base image. Record the exact Docker Engine and Docker Compose versions used for testing with:

```bash
docker --version
docker compose version
```

## 4. Clone the Repository

```bash
git clone -b docker-setup https://github.com/hizkiamarxella-svg/hotel_management.git
cd hotel_management/hotel_management
```

The application files and `compose.yaml` are located in the inner `hotel_management` directory.

Alternatively, download the repository ZIP, extract it, and open a terminal in the folder containing `compose.yaml`.

## 5. Environment Configuration

Copy `.env.example` to a new file named `.env`.

Configure these variables:

- `MARIADB_ROOT_PASSWORD`
- `MARIADB_DATABASE`
- `MARIADB_USER`
- `MARIADB_PASSWORD`

Use local development credentials only. Do not commit the `.env` file or real passwords to GitHub.

The PHP application receives its database connection settings through `DB_HOST`, `DB_NAME`, `DB_USER`, and `DB_PASSWORD`, configured by Docker Compose.

## 6. Build and Start the Application

From the directory containing `compose.yaml`, run:

```bash
docker compose up --build -d
```

Check the container status:

```bash
docker compose ps
```

## 7. Application URL and Ports

- Application URL: http://localhost:8080
- Host port: `8080`
- Container port: `80`
- Database service: `db`

The web service forwards host port 8080 to Apache on container port 80.

## 8. Verification

1. Run `docker compose ps`.
2. Confirm that the web service is running and the database service is healthy.
3. Open http://localhost:8080.
4. Open Guest Management.
5. Add a test guest and verify that the guest appears in the list.

Expected result: the website loads and guest management works with the database.

## 9. Logs and Status

View service status:

```bash
docker compose ps
```

View all service logs:

```bash
docker compose logs
```

View web logs:

```bash
docker compose logs web
```

View database logs:

```bash
docker compose logs db
```

## 10. Stop and Clean Up

Stop and remove the Compose containers and network:

```bash
docker compose down
```

The named database volume is retained by this command.

To remove the database volume, use a separate volume-removal command only when you intentionally want to delete the database data. This is not required for normal shutdown.

## 11. Troubleshooting

- **Website does not open:** Check Docker Desktop and run `docker compose ps`.
- **Database connection error:** Check `docker compose logs db` and verify the database environment variables.
- **Port 8080 is already in use:** Stop the other service using that port or change the host-side port mapping in `compose.yaml`.
- **Database initialization fails:** Check the database logs and verify the SQL initialization file is compatible with the selected database image.
- **Database data is missing:** Initialization scripts run only when the database volume is first initialized.

## 12. Known Limitations

- This configuration is intended for local development and educational testing, not production deployment.
- Database initialization depends on the SQL file being compatible with the selected database image.
- The application does not currently define a dedicated web health-check endpoint.
- Docker and database versions may affect compatibility.

## 13. Security

- `.env.example` contains placeholder development credentials.
- Do not commit real secrets, private keys, or local database backups.
- Use separate, secure credentials for any production deployment.

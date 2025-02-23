# PHP Development Environment with Docker Compose

This Docker Compose file defines a multi-container application for a PHP development environment. It includes services for a web server (Apache with PHP), a MySQL database, phpMyAdmin for database management, and Composer for dependency management.

## Services

The `services` section defines the individual containers that make up the application.

### web

* Builds the web server image using the Dockerfile in the current directory.
* Names the container `php-apache`.
* Automatically restarts the container if it fails.
* Maps port 8080 on the host to port 80 in the container.
* Mounts the `./www` directory on the host to `/var/www/html` in the container, allowing code changes to be reflected immediately.
* Connects the container to the `php_server` network.
* Depends on the `db` service and waits for it to be healthy before starting.
* Sets the `DB_HOST` environment variable to `db`, which is the hostname of the database container.

### db

* Uses the official MySQL 8 image.
* Names the container `mysql`.
* Automatically restarts the container if it fails.
* Sets environment variables for the MySQL root password, database name, user, and password.
* Creates a volume named `mysql_data` to persist database data.
* Connects the container to the `php_server` network.
* Defines a health check to ensure the database is running correctly. The `web` service depends on this service and waits for it to be healthy before starting.
* **Note:** If the MySQL container is considered "unhealthy" too soon, increase the `retries` or `interval` in the health check to give MySQL more time to become fully operational.

### phpmyadmin

* Uses the phpmyadmin image.
* Names the container `phpmyadmin`.
* Automatically restarts the container if it fails.
* Maps port 8081 on the host to port 80 in the container.
* Sets the `PMA_HOST` environment variable to `db`, which is the hostname of the database container.
* Sets the `UPLOAD_LIMIT` environment variable to `128M`.
* Depends on the `db` service.
* Connects the container to the `php_server` network.

### composer

* Uses the composer image.
* Names the container `composer`.
* Mounts the `./www` directory on the host to `/app` in the container, allowing Composer to manage project dependencies.
* Connects the container to the `php_server` network.

## Networks

The `networks` section defines the networks used by the application.

### php_server

A network that allows containers to communicate with each other.

## Volumes

The `volumes` section defines the volumes used by the application.

### mysql_data

A volume that persists the MySQL database data.


---


## Proyecto en GitHub  
[🔗 Ver el código fuente](https://github.com/Jesparzarom/simple-damp)  

## Documentación  
[📖 Leer la documentación](https://hub.docker.com/r/juanprogramm/simple-damp)

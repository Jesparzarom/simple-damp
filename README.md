# Simple DAMP Stack (Docker-based Apache, MySQL, PHP)  

A ready-to-use Docker development environment featuring Apache, MySQL, and PHP (DAMP stack). Quickly deploy PHP web applications with full MySQL database support.


### Menu
1. [Project Structure](#project-structure)
2. [Technologies Used](#technologies-used)
3. [Setup Instructions](#setup-instructions)
4. [Access Information](#access-information)
5. [Requirements](#requirements)
6. [Docker Documentation](#documentation)


---

## Project Structure  
```
simple-damp/
├── conf/
│   └── php.ini          # [Optional] Custom PHP configuration (copy to Docker container as needed)
├── scripts/
│   └── simple-damp.bat  # [Optional] Interactive menu script (add to PATH for terminal access via 'simple-damp'). Available only through git clone or download as a ZIP.
├── www/
│   ├── php-app/         # Your PHP projects should be placed inside this (e.g., public_html, htdocs, etc.).
│   │   └── index.php
│   └── other-app/
│       └── index.php
├── Dockerfile
├── docker-compose.yml
├── LICENSE
└── README.md
```
## Technologies Used
| Technology                | Description                          |
|---------------------------|--------------------------------------|
| **PHP 8.2 with Apache**    | Used for server-side scripting on Debian |
| **MySQL 8**                | Database system used for data storage |
| **phpMyAdmin**             | Tool for managing MySQL databases    |
| **Composer**               | Dependency manager for PHP           |


---

## Setup Instructions
Open your terminal (CMD, PowerShell, Shell, Bash, etc.) and navigate to the desired directory where you want to host the simple-damp project. Then:

| Step                                | Command/Action                                                                 |
|-------------------------------------|--------------------------------------------------------------------------------|
| **Clone the repository or [download Zip](https://github.com/Jesparzarom/simple-damp/archive/refs/heads/main.zip)** | `git clone https://github.com/Jesparzarom/simple-damp.git` |
| **Enter the simple-damp environment** | `cd simple-damp`                                                           |
| **Start the container**             | `docker-compose up -d`                                                     |


## Access Information

| Service                     | URL                         |
|-----------------------------|-----------------------------|
| **Web Base Path**          | [http://localhost:8080](http://localhost:8080)  |
| **phpMyAdmin (MySQL)**       | [http://localhost:8081](http://localhost:8081)  |


## Requirements
- Docker Engine
- Docker Compose

---


## HitHub Project 
[🔗 GitHub Repo](https://github.com/Jesparzarom/simple-damp)  

## Documentation
> docker repository

[📖 Read the documentation](https://hub.docker.com/r/juanprogramm/simple-damp)

---



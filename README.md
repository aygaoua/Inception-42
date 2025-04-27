# Inception - 42 Project
Overview
Inception is a system administration and DevOps project for 42 School.
The goal is to set up a secure, scalable, and functional virtualized infrastructure using Docker containers.

Project Structure
Docker Compose: Manage multi-container applications.

Services:

Nginx: Reverse proxy and SSL termination.

WordPress: CMS setup.

MariaDB: Database management.

Static Website: Custom static content service.

Features
SSL/TLS encryption (self-signed certificates).

Secure user and database setup.

Persistent volumes for data safety.

Automated container orchestration with Docker Compose.

Installation
```bash
git clone https://github.com/aygaoua/inception-42.git
cd inception-42
make
```
Ensure Docker and Docker Compose are installed on your machine.

Usage
Access WordPress at ```https://azgaoua.42.fr```

login at: ```https://azgaoua.42.fr/wp-admin```

Requirements
Docker 20.10+

Docker Compose 1.29+

Linux distribution (recommended: Debian/Ubuntu/CentOS)

Notes
This project follows 42 School guidelines.
Every service is containerized individually with strict security rules applied.

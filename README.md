## Instalación
### 1. Desplegar N8N
#### Configurar el archivo .env con las siguientes variables de entorno:
```
POSTGRES_CONTAINER=
POSTGRES_PORT=
POSTGRES_DB=
POSTGRES_USER=
POSTGRES_PASSWORD=
DOCKER_NETWORK_NAME=
```
#### Crear el contenedor de N8N en Docker con el archivo docker-compose.yml:
`docker compose up -d`

### 2. Desplegar el Servidor MCP
#### Configurar el archivo odoo_config.json con las siguientes variables:
```
{
    "url": "https://your-url.com",
    "db": "your_db",
    "username": "your@username.com",
    "password": "your-password"
}
```
#### Crear la imagen del servidor en Docker usando el Dockerfile:
`docker build -t your-image-name .`
#### Crear el contenedor del servidor MCP en Docker:
`docker run -d -p <MACHINE_PORT>:<CONTAINER_PORT> --network your-network-name --name your-container-name your-image-name`

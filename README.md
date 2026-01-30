# Node.js Base Project

Este es un proyecto base (boilerplate) robusto y bien estructurado para iniciar aplicaciones backend con **Node.js** y **Express**. Está diseñado para ser escalable, fácil de mantener y sigue las mejores prácticas de desarrollo.

## 🚀 Tecnologías Usadas

El proyecto utiliza un stack tecnológico moderno y eficiente:

- **[Node.js](https://nodejs.org/)**: Entorno de ejecución para JavaScript.
- **[TypeScript](https://www.typescriptlang.org/)**: Superset tipado de JavaScript.
- **[Express](https://expressjs.com/)**: Framework web rápido y minimalista.
- **[Helmet](https://helmetjs.github.io/)**: Middleware de seguridad para configurar cabeceras HTTP.
- **[Cors](https://github.com/expressjs/cors)**: Middleware para habilitar Cross-Origin Resource Sharing.
- **[Morgan](https://github.com/expressjs/morgan)**: Logger de peticiones HTTP para facilitar la depuración.
- **[Dotenv](https://github.com/motdotla/dotenv)**: Carga de variables de entorno desde archivos `.env`.
- **[Nodemon](https://nodemon.io/)**: Utilidad para reiniciar automáticamente el servidor durante el desarrollo.

## 📂 Estructura del Proyecto

La arquitectura del proyecto separa claramente las responsabilidades para mantener el código limpio y organizado:

```text
/src
 ├── /config       # Configuración global y variables de entorno (Base de datos, claves API, puertos).
 ├── /controllers  # Controladores: Manejan la lógica de entrada/salida de las peticiones (Req/Res).
 ├── /middlewares  # Middlewares Express: Funciones que se ejecutan antes del controlador (Auth, Errores).
 ├── /models       # Modelos de datos: Esquemas de BD (Mongoose, Sequelize, TypeORM).
 ├── /routes       # Rutas: Definición de endpoints y asociación con sus controladores.
 ├── /services     # Servicios: Lógica de negocio pura, separada del control HTTP.
 ├── /utils        # Utilidades: Funciones auxiliares reutilizables (Loggers, formateadores, validadores).
 ├── app.ts        # Inicialización de la app Express y carga de middlewares globales.
 └── server.ts     # Punto de entrada: Arranca el servidor HTTP.
```

## 🛠️ Instalación

Sigue estos pasos para configurar el proyecto en tu máquina local:

1.  **Clona el repositorio** (si aplica) o descarga el código.
2.  **Instala las dependencias**:
    Abre una terminal en la raíz del proyecto y ejecuta:
    ```bash
    npm install
    ```
3.  **Configura las variables de entorno**:
    El proyecto incluye un archivo `.env.example`. Crea una copia llamada `.env` para tus variables locales:
    ```bash
    cp .env.example .env
    # En Windows (Powershell): copy .env.example .env
    ```

## ▶️ Cómo Arrancar

Tienes disponibles los siguientes scripts para ejecutar la aplicación:

### Modo Desarrollo
Para trabajar en local, utiliza este comando. Iniciará el servidor con `nodemon` y `ts-node`, reiniciando automáticamente ante cambios:
```bash
npm run dev
```

### Build y Producción
Para compilar el código TypeScript a JavaScript:
```bash
npm run build
```

Para ejecutar la aplicación en producción (usando el código compilado en `dist/`):
```bash
npm start
```

## 🧪 Verificar el Estado

Una vez arrancado el servidor (por defecto en el puerto 3000), puedes comprobar que todo funciona correctamente haciendo una petición al endpoint de salud:

- **URL**: `http://localhost:3000/api/health`
- **Respuesta esperada**:
  ```json
  {
    "status": "success",
    "message": "Server is running",
    "timestamp": "..."
  }
  ```

## 🐳 Docker

El proyecto incluye configuración lista para contenerizar la aplicación.

### Construir la imagen

Ejecuta el siguiente comando en la raíz del proyecto para construir la imagen de Docker:

```bash
docker build -t node-base-app .
```

### Ejecutar el contenedor

Una vez construida la imagen, puedes arrancar un contenedor mapeando el puerto 3000:

```bash
docker run -p 3000:3000 --name mi-api-node node-base-app
```

### Variables de entorno en Docker

Para pasar variables de entorno al contenedor (como las definidas en tu `.env`), usa la opción `--env-file`:

```bash
docker run -p 3000:3000 --env-file .env node-base-app
```

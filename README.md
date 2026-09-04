# Programa de Fidelización de Clientes

Aplicación web para el registro de clientes en un programa de fidelización de marcas de ropa GCO. Permite a los usuarios registrarse con sus datos personales, ubicación geográfica y marca preferida.

## Tecnologías

| Capa | Tecnología | Versión |
|------|-----------|---------|
| Backend | Spring Boot | 4.1.1 |
| Backend | Java | 17 |
| Backend | H2 Database | En memoria |
| Frontend | React | 19.2.8 |
| Frontend | Vite | 8.2.2 |
| Frontend | Axios | 1.20.0 |

## Estructura del Proyecto

```
prueba tecnica/
├── backend/                    # API REST con Spring Boot
│   └── src/main/java/com/pagina/fidelidad/
│       ├── FidelidadApplication.java
│       ├── entity/             # Entidades JPA
│       ├── repository/         # Repositorios Spring Data
│       ├── controller/         # Controlador REST
│       ├── config/             # Configuración CORS
│       └── exception/          # Manejo global de errores
│
└── frontend/                   # Interfaz con React + Vite
    └── src/
        ├── App.jsx
        ├── components/
        │   └── RegistroCliente.jsx
        └── services/
            └── api.js
```

## Backend

### Entidades

- **Cliente** - Registro principal del cliente (nombres, apellidos, fecha de nacimiento, número de identificación, dirección)
- **Pais** - Catálogo de países (Colombia, México, Argentina, España)
- **Departamento** - Departamentos/estados por país
- **Ciudad** - Ciudades por departamento
- **Marca** - Marcas de ropa (Americanino, American Eagle, Chevignon, Esprit, Naf Naf, Rifle)
- **TipoIdentificacion** - Tipos de documento (Cédula de Ciudadanía, Cédula de Extranjería, Pasaporte)

### Endpoints REST

| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/api/tipos-id` | Lista tipos de identificación |
| GET | `/api/paises` | Lista países disponibles |
| GET | `/api/departamentos/{paisId}` | Departamentos por país |
| GET | `/api/ciudades/{deptoId}` | Ciudades por departamento |
| GET | `/api/marcas` | Lista marcas disponibles |
| POST | `/api/registro` | Registrar un nuevo cliente |

### Base de Datos H2

El proyecto utiliza **H2 Database en memoria** como base de datos. Los datos se llenan automáticamente al iniciar el servidor con los scripts `schema.sql` y `data.sql`.

Consola de administración disponible en:
```
http://localhost:8080/h2-console/login.jsp
```

## Frontend

### Componentes

- **RegistroCliente.jsx** - Componente principal con formulario de registro que incluye:
  - Dropdowns en cascada (País → Departamento → Ciudad)
  - Filtrado de inputs (solo números para identificación, solo letras para nombres)
  - Validación en tiempo real
  - Modales de éxito y error
  - Alternancia de tema oscuro/claro
  - Diseño responsive (1-3 columnas según dispositivo)

### Servicio API

`api.js` gestiona todas las llamadas HTTP al backend mediante Axios con baseURL `/api`.

## Instrucciones de Ejecución

### Requisitos Previos

- Java 17 o superior
- Maven (incluido como wrapper en el proyecto)
- Node.js 18 o superior
- npm

### Ejecutar Backend

```bash
cd backend
./mvnw spring-boot:run
```

El servidor arranca en `http://localhost:8080`.

### Ejecutar Frontend

```bash
cd frontend
npm install
npm run dev
```

El frontend arranca en `http://localhost:5173` y redirige las llamadas `/api` al backend mediante proxy configurado en Vite.

## Características Principales

- Formulario de registro con 10 campos organizados en 3 secciones
- Validación de datos en cliente y servidor (Jakarta Bean Validation)
- Detección de cédulas duplicadas con mensaje de error amigable
- Catálogos geográficos completos (4 países, 45 departamentos, 70 ciudades)
- Tema oscuro y claro con alternancia en tiempo real
- Diseño responsive para escritorio, tablet y móvil
- Configuración CORS para desarrollo y producción

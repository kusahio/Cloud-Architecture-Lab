<span style="font-size: 12px;">**[>> Regresar](../README.md)**</span>

# Decisiones de Arquitectura

## Introducción

Este documento registra las principales decisiones técnicas tomadas durante el desarrollo del laboratorio.

Su objetivo no es justificar que una tecnología sea mejor que otra, sino explicar el razonamiento detrás de cada elección dentro del contexto del proyecto.

Muchas decisiones podrán modificarse a medida que evolucione la arquitectura. Esa evolución forma parte del objetivo del laboratorio.

---

# ADR-001
## ¿Por qué NestJS?

### Contexto

El proyecto necesita una base sólida sobre la cual evolucionar durante múltiples etapas.

Además del desarrollo de funcionalidades, el laboratorio busca explorar conceptos relacionados con arquitectura backend.

### Decisión

Se seleccionó NestJS como framework principal.

### Razones

- Arquitectura modular.
- Dependency Injection incorporado.
- Excelente soporte para TypeScript.
- Escalable.
- Muy utilizado en entornos empresariales.
- Facilita separar responsabilidades.

### Alternativas consideradas

- Express
- Fastify
- FastAPI

### Consecuencias

La curva de aprendizaje inicial es mayor que otros frameworks, pero ofrece una estructura más adecuada para proyectos de largo plazo.

---

# ADR-002
## ¿Por qué Prisma?

### Contexto

El proyecto requiere una forma mantenible de acceder a PostgreSQL.

### Decisión

Utilizar Prisma como ORM.

### Razones

- Excelente integración con TypeScript.
- Cliente fuertemente tipado.
- Migraciones.
- Buena experiencia de desarrollo.
- Documentación clara.

### Alternativas consideradas

- TypeORM
- Sequelize
- Drizzle ORM

### Consecuencias

Prisma simplifica gran parte del acceso a datos, aunque algunas consultas complejas pueden requerir SQL específico.

---

# ADR-003
## ¿Por qué PostgreSQL?

### Contexto

La aplicación necesita almacenar información relacional.

### Decisión

Utilizar PostgreSQL como base de datos principal.

### Razones

- Base de datos ampliamente utilizada.
- Excelente soporte para relaciones.
- Alta estabilidad.
- Gran ecosistema.
- Compatible con Prisma.

### Alternativas consideradas

- MySQL
- MariaDB
- SQLite

### Consecuencias

Permite trabajar con un motor ampliamente utilizado en producción.

---

# ADR-004
## ¿Por qué Docker?

### Contexto

El entorno de desarrollo debe ser reproducible.

### Decisión

Containerizar los principales componentes del proyecto.

### Razones

- Consistencia entre entornos.
- Configuración sencilla.
- Fácil incorporación de nuevos servicios.
- Menor dependencia de la máquina local.

### Consecuencias

Se simplifica la instalación del proyecto y futuras integraciones.

---

# ADR-005
## ¿Por qué LocalStack?

### Contexto

El laboratorio incorpora servicios AWS durante distintas etapas.

Trabajar directamente sobre AWS incrementaría los costos y dificultaría experimentar libremente.

### Decisión

Utilizar LocalStack para el desarrollo local.

### Razones

- Simulación de servicios AWS.
- Desarrollo offline.
- Menor costo.
- Mayor velocidad de iteración.

### Consecuencias

Algunos comportamientos pueden diferir del entorno real, por lo que ciertas validaciones deberán realizarse posteriormente sobre AWS.

---

# ADR-006
## ¿Por qué Amazon S3?

### Contexto

Los documentos no deberían almacenarse dentro del servidor.

### Decisión

Utilizar almacenamiento de objetos.

### Razones

- Escalabilidad.
- Durabilidad.
- Separación de responsabilidades.
- Integración con otros servicios AWS.

### Alternativas consideradas

- Sistema de archivos local.
- NFS.
- MinIO.

### Consecuencias

La aplicación deja de depender del almacenamiento local.

---

# ADR-007
## ¿Por qué Amazon SQS?

### Contexto

Algunas tareas pueden ejecutarse después de responder al usuario.

### Decisión

Procesarlas mediante colas.

### Razones

- Procesamiento asíncrono.
- Desacoplamiento.
- Reintentos.
- Mejor experiencia de usuario.

### Alternativas consideradas

- Ejecución síncrona.
- Cron Jobs.

### Consecuencias

La arquitectura incorpora consistencia eventual y mayor complejidad operativa.

---

# ADR-008
## ¿Por qué Amazon SNS?

### Contexto

Distintos componentes necesitan reaccionar ante el mismo evento.

### Decisión

Adoptar un modelo Publish/Subscribe.

### Razones

- Bajo acoplamiento.
- Escalabilidad.
- Mayor flexibilidad.

### Alternativas consideradas

- Llamadas HTTP entre servicios.

### Consecuencias

Los componentes dejan de conocerse directamente.

---

# ADR-009
## ¿Por qué AWS Lambda?

### Contexto

Algunas tareas son esporádicas y no requieren un servicio dedicado.

### Decisión

Ejecutarlas mediante funciones serverless.

### Razones

- Escalado automático.
- Pago por uso.
- Separación de responsabilidades.

### Consecuencias

Parte de la lógica deja de ejecutarse dentro del backend principal.

---

# ADR-010
## ¿Por qué Terraform?

### Contexto

A medida que aumenta la cantidad de recursos cloud resulta difícil mantener configuraciones manuales.

### Decisión

Administrar infraestructura mediante código.

### Razones

- Reproducibilidad.
- Versionado.
- Automatización.
- Menor intervención manual.

### Alternativas consideradas

- Configuración manual desde AWS Console.

### Consecuencias

Toda la infraestructura podrá reconstruirse desde un repositorio Git.

---

# Principios utilizados para tomar decisiones

Durante todo el laboratorio se intentará mantener los siguientes principios.

## Resolver problemas antes que incorporar tecnologías

Las herramientas aparecen cuando existe una necesidad real.

---

## Favorecer bajo acoplamiento

Siempre que resulte razonable se buscará minimizar las dependencias directas entre componentes.

---

## Evolución incremental

La arquitectura crecerá paso a paso.

No se implementarán componentes únicamente por anticipación.

---

## Documentar las decisiones

Cada incorporación importante quedará documentada junto con sus motivaciones y consecuencias.

El objetivo no consiste únicamente en conservar un historial técnico, sino también en facilitar la comprensión de la evolución del proyecto.

<span style="font-size: 12px;">**[>> Regresar](../README.md)**</span>
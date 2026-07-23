<span style="font-size: 12px;">**[>> Regresar](../README.md)**</span>

# Roadmap

## Introducción

Este documento describe la evolución planificada del proyecto.

Cada etapa incorpora un nuevo componente arquitectónico únicamente cuando aparece un problema que justifica su utilización.

El objetivo no consiste en utilizar la mayor cantidad posible de servicios cloud, sino comprender en qué momento comienzan a aportar valor dentro de una aplicación.

---

# Estado general

| Etapa | Estado |
|--------|--------|
| 0. Fundación del proyecto | ⚙ |
| 1. Amazon S3 | ⏱ |
| 2. IAM | ⏱ |
| 3. Lambda | ⏱ |
| 4. Amazon SQS | ⏱ |
| 5. Amazon SNS | ⏱ |
| 6. Observabilidad | ⏱ |
| 7. Secrets Manager | ⏱ |
| 8. DynamoDB | ⏱ |
| 9. CI/CD | ⏱ |
| 10. Terraform | ⏱ |

---

# Etapa 0 — Fundación

## Problema

Antes de incorporar componentes cloud es necesario contar con una base sólida sobre la cual evolucionar.

## Objetivo

Construir un backend modular preparado para crecer.

## Implementación

- NestJS
- Prisma
- PostgreSQL
- Docker
- Docker Compose
- LocalStack
- Configuración por entornos

## Conceptos

- Arquitectura modular
- Dependency Injection
- ORM
- Contenedores
- Variables de entorno

## Resultado esperado

Contar con una API estable sobre la cual incorporar nuevos componentes.

Estado:

⚙ En Proceso

---

# Etapa 1 — Amazon S3

## Problema

Los documentos no deberían almacenarse dentro del servidor de aplicaciones.

El almacenamiento local dificulta la escalabilidad, el respaldo y el despliegue.

## Objetivo

Separar el almacenamiento físico de los archivos del backend.

## Implementación

- Buckets
- Upload
- Download
- Versionado
- Presigned URLs

## Conceptos

- Object Storage
- Metadata
- Durabilidad
- Escalabilidad

## Resultado esperado

Los documentos pasan a almacenarse en S3 en lugar del sistema de archivos.

Estado:

⏱ Pendiente

---

# Etapa 2 — IAM

## Problema

Las aplicaciones no deberían utilizar credenciales con permisos completos.

## Objetivo

Aplicar el principio de mínimo privilegio.

## Implementación

- Usuarios
- Roles
- Policies
- Permisos específicos

## Conceptos

- Seguridad
- Least Privilege
- Roles
- Policies

## Resultado esperado

Cada componente accede únicamente a los recursos necesarios.

Estado:

⏱ Pendiente

---

# Etapa 3 — AWS Lambda

## Problema

Algunas tareas no requieren ejecutarse dentro del backend principal.

## Objetivo

Delegar procesamiento puntual mediante funciones serverless.

## Implementación

- Procesamiento de documentos
- Generación de miniaturas
- Conversión de archivos

## Conceptos

- Serverless
- Eventos
- Escalabilidad automática

## Resultado esperado

Reducir carga sobre la API principal.

Estado:

⏱ Pendiente

---

# Etapa 4 — Amazon SQS

## Problema

Algunas operaciones pueden tardar varios segundos y afectan la experiencia del usuario.

## Objetivo

Desacoplar el procesamiento utilizando colas.

## Implementación

- Queue
- Producer
- Consumer
- Retry
- Dead Letter Queue

## Conceptos

- Procesamiento asíncrono
- Message Queue
- Eventual Consistency

## Resultado esperado

Las tareas pesadas pasan a ejecutarse en segundo plano.

Estado:

⏱ Pendiente

---

# Etapa 5 — Amazon SNS

## Problema

Varios componentes necesitan reaccionar al mismo evento sin depender directamente entre sí.

## Objetivo

Introducir comunicación basada en eventos.

## Implementación

Eventos como:

- Documento creado
- Documento procesado
- Documento eliminado

Suscriptores:

- Auditoría
- Notificaciones
- Métricas

## Conceptos

- Pub/Sub
- Event Driven Architecture
- Desacoplamiento

## Resultado esperado

Los servicios comienzan a comunicarse mediante eventos.

Estado:

⏱ Pendiente

---

# Etapa 6 — Observabilidad

## Problema

A medida que aumenta la cantidad de componentes resulta más difícil comprender el estado del sistema.

## Objetivo

Centralizar logs y métricas.

## Implementación

- CloudWatch
- Structured Logging
- Dashboards
- Alarmas

## Conceptos

- Logging
- Metrics
- Monitoring
- Tracing

## Resultado esperado

Mejorar la capacidad para detectar y analizar problemas.

Estado:

⏱ Pendiente

---

# Etapa 7 — Secrets Manager

## Problema

Las credenciales sensibles no deberían almacenarse dentro del código fuente ni en archivos de configuración.

## Objetivo

Centralizar la administración de secretos.

## Implementación

- Database credentials
- API Keys
- JWT Secret

## Conceptos

- Secret Rotation
- Security
- Credential Management

## Resultado esperado

El proyecto elimina secretos embebidos dentro del código.

Estado:

⏱ Pendiente

---

# Etapa 8 — DynamoDB

## Problema

No toda la información requiere un modelo relacional.

## Objetivo

Evaluar cuándo una base NoSQL resulta más conveniente.

## Implementación

- Cache
- Metadata
- Consultas rápidas

## Conceptos

- NoSQL
- Key-Value
- Partition Key

## Resultado esperado

Comprender escenarios donde DynamoDB aporta ventajas sobre PostgreSQL.

Estado:

⏱ Pendiente

---

# Etapa 9 — CI/CD

## Problema

Los despliegues manuales son repetitivos y propensos a errores.

## Objetivo

Automatizar pruebas y despliegues.

## Implementación

- GitHub Actions
- Build
- Test
- Lint
- Deploy

## Conceptos

- Continuous Integration
- Continuous Delivery
- Automatización

## Resultado esperado

Cada cambio validado podrá desplegarse automáticamente.

Estado:

⏱ Pendiente

---

# Etapa 10 — Terraform

## Problema

La infraestructura configurada manualmente resulta difícil de reproducir.

## Objetivo

Definir toda la infraestructura como código.

## Implementación

- S3
- IAM
- Lambda
- SQS
- SNS

## Conceptos

- Infrastructure as Code
- Declarative Infrastructure
- Versionado

## Resultado esperado

Todo el entorno podrá recrearse desde cero mediante Terraform.

Estado:

⏱ Pendiente

---

# Evolución esperada

El proyecto evolucionará aproximadamente siguiendo este recorrido.

```

NestJS

↓

PostgreSQL

↓

Amazon S3

↓

Lambda

↓

Amazon SQS

↓

Amazon SNS

↓

Observabilidad

↓

Terraform

```

Cada etapa representa una evolución de la arquitectura y no únicamente la incorporación de una nueva tecnología.

Al finalizar el laboratorio el proyecto habrá transitado desde una aplicación monolítica hasta una arquitectura backend mucho más desacoplada, preparada para escalar y apoyada en distintos servicios cloud.

<span style="font-size: 12px;">**[>> Regresar](../README.md)**</span>
# Cloud Architecture Lab

Repositorio personal para explorar arquitectura backend moderna, sistemas distribuidos y servicios cloud mediante el desarrollo incremental de un sistema de gestión documental.

Más que desarrollar un gestor documental completo, este proyecto utiliza dicho dominio como un caso de estudio para comprender cómo evolucionan las aplicaciones modernas a medida que incorporan nuevas necesidades de arquitectura.

El objetivo no es aprender un framework o un servicio cloud de forma aislada, sino comprender las decisiones de diseño detrás de aplicaciones backend preparadas para crecer de forma ordenada.

---

# Objetivos

Este laboratorio busca profundizar en conceptos de ingeniería backend mediante la implementación progresiva de distintos componentes arquitectónicos.

Los principales objetivos son:

- Diseñar aplicaciones backend utilizando NestJS.
- Comprender cuándo utilizar distintos servicios cloud.
- Explorar arquitecturas desacopladas.
- Aprender comunicación síncrona y asíncrona.
- Implementar procesamiento basado en eventos.
- Automatizar infraestructura y procesos de despliegue.
- Incorporar observabilidad desde las primeras etapas del proyecto.
- Comprender cómo evoluciona una aplicación monolítica hacia una arquitectura distribuida.

---

# Filosofía del proyecto

Cada tecnología incorporada dentro del proyecto responde a un problema concreto.

No se agregan servicios únicamente para aumentar el stack tecnológico.

La evolución del sistema intenta replicar cómo crecen aplicaciones reales:

- primero aparece un problema,
- luego se analizan distintas alternativas,
- finalmente se incorpora la tecnología más adecuada para resolverlo.

El objetivo principal consiste en comprender **por qué** utilizar una tecnología y no únicamente **cómo** utilizarla.

---

# Stack tecnológico

## Backend

- NestJS
- TypeScript
- Prisma ORM
- PostgreSQL

## Infraestructura

- Docker
- Docker Compose
- LocalStack

## Servicios Cloud

- Amazon S3
- IAM
- Secrets Manager
- Lambda
- API Gateway
- Amazon SQS
- Amazon SNS
- CloudWatch
- DynamoDB

## DevOps

- GitHub Actions
- Terraform

---

# Evolución del proyecto

La arquitectura evolucionará progresivamente incorporando nuevos componentes cloud únicamente cuando sean necesarios.

| Etapa | Estado |
|--------|--------|
| Base del proyecto | ✓ |
| Amazon S3 | ⏱ |
| IAM | ⏱ |
| Secrets Manager | ⏱ |
| Lambda | ⏱ |
| Amazon SQS | ⏱ |
| Amazon SNS | ⏱ |
| Observabilidad | ⏱ |
| DynamoDB | ⏱ |
| CI/CD | ⏱ |
| Terraform | ⏱ |

**[>> Ver roadmap completo](./docs/roadmap.md)**

---

# Arquitectura

Actualmente el proyecto comienza como un backend monolítico desarrollado con NestJS.

A medida que avance el laboratorio se incorporarán nuevos componentes para explorar distintos patrones arquitectónicos como:

- almacenamiento desacoplado
- procesamiento asíncrono
- comunicación mediante eventos
- funciones serverless
- observabilidad
- Infrastructure as Code

**[>> Ver arquitectura](./docs/architecture.md)**

---

# Estado actual

Actualmente el proyecto se encuentra construyendo la infraestructura base:

- NestJS
- PostgreSQL
- Prisma
- Docker
- LocalStack

A partir de esta base comenzará la incorporación progresiva de servicios cloud.

---

# Ejecutar el proyecto (No Disponible)

## Requisitos

- Docker
- Docker Compose
- Node.js
- AWS CLI
- awslocal

## Instalación

```bash
git clone https://github.com/tuusuario/cloud-architecture-lab.git

cd cloud-architecture-lab

docker compose up --build
```

---

# Documentación

La documentación se encuentra organizada por áreas.

| Documento | Descripción |
|-----------|-------------|
| docs/architecture.md | Filosofía del proyecto, arquitectura y evolución del sistema |
| docs/roadmap.md | Roadmap completo del laboratorio |
| docs/services.md | Rol de cada servicio cloud dentro del proyecto |
| docs/adrs.md | Decisiones de diseño y arquitectura |

---

# Objetivos de aprendizaje

Al finalizar este laboratorio se espera haber profundizado especialmente en:

- Arquitectura backend con NestJS.
- Diseño de aplicaciones desacopladas.
- Integración progresiva de servicios cloud.
- Arquitecturas orientadas a eventos.
- Comunicación asíncrona.
- Observabilidad.
- Automatización mediante CI/CD.
- Infrastructure as Code con Terraform.
- Buenas prácticas para aplicaciones backend preparadas para ejecutarse en la nube.

---

# Estado del laboratorio

Este repositorio se encuentra en desarrollo continuo.

Cada nueva etapa representa una evolución de la arquitectura y documenta tanto la implementación como las decisiones tomadas durante el proceso.

---

# Licencia

Proyecto personal orientado al aprendizaje, experimentación y validación de conceptos relacionados con arquitectura backend, cloud computing e ingeniería de software.

Actualmente no posee una licencia de distribución.
# Cloud Architecture Lab

**Repositorio personal para explorar arquitectura backend moderna, sistemas distribuidos y servicios cloud mediante el desarrollo incremental de un sistema de gestión documental.**

El proyecto utiliza **NestJS** como base y **LocalStack** para simular servicios de AWS localmente, permitiendo experimentar con distintos componentes cloud sin depender de infraestructura externa.

Más que desarrollar un gestor documental completo, el objetivo es utilizar este dominio como un caso de estudio para comprender cómo evolucionan las aplicaciones modernas a medida que incorporan nuevas necesidades de arquitectura.

El objetivo no es aprender un framework o un servicio cloud en particular, sino comprender las decisiones de diseño detrás de aplicaciones backend preparadas para crecer de forma ordenada.

---

# ¿Por qué un gestor documental?

Elegí un sistema de gestión documental porque representa un dominio sencillo, pero suficientemente flexible para incorporar progresivamente distintos servicios cloud.

Cada nueva necesidad funcional del sistema justifica la incorporación de un nuevo componente de infraestructura, permitiendo comprender el propósito de cada servicio dentro de una arquitectura real.

En lugar de añadir tecnologías porque sí, cada una responde a un problema concreto que aparece durante la evolución del proyecto.

---

# ¿Por qué existe este proyecto?

Este proyecto nace para profundizar en conceptos de arquitectura cloud que difícilmente se pueden experimentar en aplicaciones tradicionales.

**Más que aprender servicios específicos de AWS, el objetivo es comprender las decisiones de arquitectura detrás de aplicaciones distribuidas, desacopladas y preparadas para evolucionar.**

Los principales objetivos son:

- Diseñar aplicaciones backend utilizando NestJS.
- Comprender el propósito de los principales servicios cloud.
- Explorar arquitecturas orientadas a eventos.
- Aprender patrones de comunicación síncrona y asíncrona.
- Automatizar infraestructura y procesos de despliegue.
- Comprender cómo evoluciona una aplicación moderna desde un backend monolítico hacia una arquitectura distribuida.

El proyecto continuará evolucionando como un laboratorio personal para validar decisiones de arquitectura, incorporar nuevos componentes cloud y profundizar en conceptos de ingeniería de software.

---

# Preguntas que busco responder

Durante el desarrollo intento responder preguntas como:

- ¿Cuándo conviene utilizar almacenamiento de objetos?
- ¿Qué problemas resuelve una arquitectura basada en eventos?
- ¿Cuándo utilizar colas de mensajes?
- ¿Cómo desacoplar responsabilidades entre distintos componentes?
- ¿Qué beneficios aporta el procesamiento serverless?
- ¿Cómo monitorear aplicaciones distribuidas?
- ¿Cómo administrar secretos de manera segura?
- ¿Cómo automatizar infraestructura utilizando Infrastructure as Code?

---

# Enfoque del proyecto

Aunque el dominio elegido corresponde a un sistema de gestión documental, el foco principal del proyecto está en la evolución de la arquitectura y no en desarrollar todas las funcionalidades que tendría un producto comercial.

Cada nueva característica se incorpora únicamente cuando permite explorar un nuevo concepto técnico, validar una decisión de diseño o comprender el propósito de un servicio cloud dentro de una arquitectura real.

---

# Principios del proyecto

Durante el desarrollo intento mantener algunas decisiones constantes:

- Favorecer código legible antes que soluciones complejas.
- Mantener una arquitectura desacoplada y modular.
- Priorizar mantenibilidad sobre optimizaciones prematuras.
- Incorporar nuevas tecnologías únicamente cuando resuelvan un problema concreto.
- Comprender primero el problema antes de elegir la tecnología adecuada.

---

# Stack principal

## Backend

- NestJS
- TypeScript
- Prisma
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
- SQS
- SNS
- CloudWatch
- DynamoDB

## DevOps

- GitHub Actions
- Terraform

---

# Roadmap

## ✅ Hito 0 — Base del proyecto (Actual)

### Objetivo

Construir una API REST utilizando NestJS preparada para evolucionar.

### Implementación

- [ ] Configuración de NestJS
- [ ] PostgreSQL
- [ ] Prisma
- [ ] Docker
- [ ] Docker Compose
- [ ] LocalStack
- [ ] AWS CLI
- [ ] awslocal

### Resultado esperado

El sistema permite gestionar usuarios y documentos utilizando almacenamiento local.

---

## ☐ Hito 1 — Almacenamiento con Amazon S3

### Problema

El almacenamiento local limita la escalabilidad y disponibilidad del sistema.

### Objetivo

Migrar el almacenamiento de documentos hacia Amazon S3.

### Aprendizajes

- [ ] Buckets
- [ ] Objetos
- [ ] Metadata
- [ ] Versionado

### Resultado esperado

Los documentos se almacenan en S3 y dejan de depender del sistema de archivos.

---

## ☐ Hito 2 — Control de acceso mediante IAM

### Problema

La aplicación necesita acceder únicamente a los recursos necesarios.

### Objetivo

Comprender cómo administrar permisos utilizando IAM.

### Aprendizajes

- [ ] Usuarios
- [ ] Roles
- [ ] Policies
- [ ] Principio de mínimo privilegio

### Resultado esperado

La aplicación utiliza permisos específicos para acceder únicamente a los recursos requeridos.

---

## ☐ Hito 3 — Gestión de secretos

### Problema

Las credenciales no deberían formar parte del código fuente.

### Objetivo

Gestionar secretos utilizando AWS Secrets Manager.

### Aprendizajes

- [ ] JWT Secrets
- [ ] API Keys
- [ ] Variables sensibles

### Resultado esperado

Las credenciales se administran desde un servicio centralizado.

---

## ☐ Hito 4 — Procesamiento mediante Lambda

### Problema

El procesamiento de documentos aumenta el tiempo de respuesta de la API.

### Objetivo

Delegar tareas pesadas a funciones serverless.

### Procesos

- [ ] Generación de miniaturas
- [ ] Extracción de metadata
- [ ] Validaciones
- [ ] Conversión de archivos

### Resultado esperado

Los documentos se procesan de manera independiente al flujo principal.

---

## ☐ Hito 5 — Comunicación asíncrona con SQS

### Problema

El procesamiento no debería bloquear la respuesta al usuario.

### Objetivo

Desacoplar procesos utilizando colas de mensajes.

### Aprendizajes

- [ ] Producers
- [ ] Consumers
- [ ] Dead Letter Queue

### Resultado esperado

Cada documento genera tareas que son procesadas por workers independientes.

---

## ☐ Hito 6 — Eventos mediante SNS

### Problema

Otros componentes necesitan reaccionar cuando finaliza un proceso.

### Objetivo

Implementar comunicación basada en eventos.

### Eventos

- [ ] Documento procesado
- [ ] Documento eliminado
- [ ] Error de procesamiento

### Resultado esperado

Los componentes se comunican mediante eventos sin depender directamente entre sí.

---

## ☐ Hito 7 — Observabilidad

### Problema

La aplicación ahora posee múltiples procesos ejecutándose simultáneamente.

### Objetivo

Centralizar logs y métricas.

### Servicios

- [ ] CloudWatch

### Resultado esperado

Toda la aplicación puede monitorearse desde un único punto.

---

## ☐ Hito 8 — Auditoría utilizando DynamoDB

### Problema

Es necesario mantener un historial de acciones sobre cada documento.

### Objetivo

Explorar el uso de bases de datos NoSQL para auditoría.

### Aprendizajes

- [ ] Modelado NoSQL
- [ ] Índices
- [ ] Queries

### Resultado esperado

Cada acción realizada sobre un documento queda registrada.

---

## ☐ Hito 9 — Integración continua

### Objetivo

Automatizar pruebas, compilación y validaciones del proyecto.

### Implementación

- [ ] Lint
- [ ] Tests
- [ ] Build
- [ ] GitHub Actions

### Resultado esperado

Cada cambio es validado automáticamente antes de integrarse.

---

## ☐ Hito 10 — Infrastructure as Code

### Objetivo

Describir completamente la infraestructura mediante código.

### Implementación

- [ ] Terraform
- [ ] Variables
- [ ] Outputs
- [ ] Módulos

### Resultado esperado

Toda la infraestructura puede recrearse automáticamente desde cero.

---

# Aprendizajes esperados

Al finalizar este proyecto espero haber profundizado especialmente en:

- Arquitectura backend utilizando NestJS.
- Diseño de aplicaciones desacopladas.
- Integración progresiva de servicios cloud.
- Arquitecturas orientadas a eventos.
- Observabilidad de aplicaciones distribuidas.
- Comunicación asíncrona entre componentes.
- Automatización mediante CI/CD.
- Infrastructure as Code con Terraform.
- Buenas prácticas para aplicaciones backend preparadas para ejecutarse en la nube.

---

# Futuras mejoras

- Amazon EventBridge
- AWS Step Functions
- Amazon ECS
- Amazon Cognito
- Redis
- Kafka
- OpenTelemetry
- Kubernetes

---

## Licencia

Proyecto personal de práctica y experimentación orientado al aprendizaje de arquitectura backend, servicios cloud e ingeniería de software.

Sin licencia formal.
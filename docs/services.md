<span style="font-size: 12px;">**[>> Regresar](../README.md)**</span>

# Servicios Cloud

## Introducción

Este documento describe el propósito de cada servicio cloud incorporado en el laboratorio.

El objetivo no consiste en aprender servicios de AWS de forma aislada, sino comprender cuándo comienzan a aportar valor dentro de una arquitectura backend.

Cada servicio aparece únicamente cuando el sistema presenta una necesidad concreta.

---

# Amazon S3

## Problema

Almacenar documentos dentro del servidor de aplicaciones presenta varias limitaciones.

- El almacenamiento no escala fácilmente.
- Los despliegues pueden afectar los archivos existentes.
- Compartir archivos entre múltiples instancias resulta complejo.
- El respaldo depende del servidor.

## Solución

Amazon S3 proporciona almacenamiento de objetos altamente disponible y desacoplado de la aplicación.

Los documentos dejan de depender del backend y pasan a almacenarse en un servicio especializado.

## Casos de uso dentro del proyecto

- Almacenamiento de documentos.
- Descarga de archivos.
- Versionado.
- Presigned URLs.
- Gestión de metadatos.

## Beneficios

- Escalabilidad prácticamente ilimitada.
- Alta durabilidad.
- Desacoplamiento entre aplicación y almacenamiento.
- Integración sencilla con otros servicios AWS.

---

# IAM

## Problema

Las aplicaciones no deberían ejecutar todas sus operaciones utilizando credenciales con permisos administrativos.

Esto incrementa el riesgo de accesos no autorizados y dificulta aplicar el principio de mínimo privilegio.

## Solución

IAM permite definir permisos específicos para cada componente del sistema.

## Casos de uso dentro del proyecto

- Acceso a S3.
- Acceso a SQS.
- Acceso a SNS.
- Acceso a Secrets Manager.

## Beneficios

- Mayor seguridad.
- Permisos específicos.
- Mejor control de acceso.

---

# AWS Secrets Manager

## Problema

Las credenciales sensibles no deberían almacenarse dentro del código fuente ni en archivos de configuración.

## Solución

Centralizar la administración de secretos.

## Casos de uso

- JWT Secret.
- Database Password.
- API Keys.
- Tokens de acceso.

## Beneficios

- Mayor seguridad.
- Rotación de credenciales.
- Eliminación de secretos embebidos.

---

# AWS Lambda

## Problema

No todas las tareas necesitan ejecutarse dentro del backend principal.

Procesar documentos pesados puede aumentar los tiempos de respuesta y consumir recursos innecesariamente.

## Solución

Delegar tareas específicas a funciones serverless.

## Casos de uso

- Procesamiento de documentos.
- Conversión de archivos.
- Generación de miniaturas.
- Validaciones automáticas.

## Beneficios

- Escalado automático.
- Menor carga sobre la API.
- Pago por ejecución.

---

# Amazon SQS

## Problema

Algunas operaciones requieren varios segundos para completarse.

Realizarlas durante la petición HTTP afecta la experiencia del usuario.

## Solución

Mover estas tareas a procesamiento asíncrono mediante colas.

## Casos de uso

- Procesamiento de documentos.
- Generación de reportes.
- Envío de correos.
- Conversión de archivos.

## Beneficios

- Desacoplamiento.
- Mayor resiliencia.
- Reintentos automáticos.
- Dead Letter Queue.

---

# Amazon SNS

## Problema

Múltiples componentes necesitan reaccionar al mismo evento.

Con llamadas directas entre servicios aumenta el acoplamiento.

## Solución

Publicar eventos y permitir que distintos consumidores se suscriban a ellos.

## Casos de uso

Evento:

Documento procesado

Consumidores:

- Auditoría
- Notificaciones
- Métricas
- Logs

## Beneficios

- Arquitectura orientada a eventos.
- Bajo acoplamiento.
- Escalabilidad.

---

# Amazon CloudWatch

## Problema

A medida que la aplicación crece resulta más difícil detectar errores y comprender el estado del sistema.

## Solución

Centralizar logs, métricas y alarmas.

## Casos de uso

- Logs.
- Dashboards.
- Métricas.
- Alarmas.

## Beneficios

- Observabilidad.
- Monitoreo.
- Diagnóstico.
- Detección temprana de problemas.

---

# DynamoDB

## Problema

No toda la información requiere un modelo relacional.

Algunos escenarios priorizan velocidad y simplicidad de acceso.

## Solución

Incorporar una base NoSQL para determinados casos de uso.

## Casos de uso

- Cache.
- Metadatos.
- Información temporal.
- Contadores.

## Beneficios

- Baja latencia.
- Escalabilidad horizontal.
- Modelo flexible.

---

# GitHub Actions

## Problema

Los despliegues manuales son repetitivos y propensos a errores.

## Solución

Automatizar validaciones y despliegues.

## Casos de uso

- Lint.
- Tests.
- Build.
- Deploy.

## Beneficios

- Integración continua.
- Entregas consistentes.
- Menor intervención manual.

---

# Terraform

## Problema

Configurar infraestructura manualmente dificulta reproducir el entorno y aumenta el riesgo de errores.

## Solución

Definir toda la infraestructura como código.

## Casos de uso

- Buckets.
- IAM.
- SQS.
- SNS.
- Lambda.
- CloudWatch.

## Beneficios

- Infraestructura versionada.
- Reproducibilidad.
- Automatización.
- Trazabilidad.

---

# Relación entre los servicios

Cada servicio se incorpora únicamente cuando el proyecto presenta una necesidad específica.

La evolución prevista es la siguiente:

```

Backend

↓

Amazon S3

↓

IAM

↓

Secrets Manager

↓

Lambda

↓

Amazon SQS

↓

Amazon SNS

↓

CloudWatch

↓

Terraform

```

Este orden refleja la evolución de la arquitectura y no una dependencia técnica obligatoria entre los servicios.

Cada etapa busca responder una necesidad concreta y ampliar gradualmente los conceptos explorados durante el laboratorio.

<span style="font-size: 12px;">**[>> Regresar](../README.md)**</span>
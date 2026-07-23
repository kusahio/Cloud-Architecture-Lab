<span style="font-size: 12px;">**[>> Regresar](../README.md)**</span>

# Arquitectura

## Introducción

Cloud Architecture Lab es un laboratorio personal diseñado para explorar cómo evolucionan las aplicaciones backend modernas a medida que crecen sus necesidades funcionales y no funcionales.

En lugar de construir un proyecto centrado únicamente en un framework o un conjunto de tecnologías, el objetivo consiste en comprender las decisiones de arquitectura que aparecen durante la evolución natural de un sistema.

Cada componente incorporado responde a un problema específico y busca representar escenarios habituales en aplicaciones ejecutadas sobre infraestructura cloud.

---

# Filosofía del proyecto

Una de las principales motivaciones de este laboratorio es evitar un enfoque basado únicamente en aprender herramientas.

En proyectos reales las decisiones técnicas no aparecen porque una tecnología sea popular, sino porque resuelven un problema concreto.

Este laboratorio intenta reproducir ese proceso.

Cada nueva etapa comienza identificando una limitación del sistema actual.

A partir de ese problema se analizan distintas alternativas y finalmente se incorpora la tecnología que mejor responde a esa necesidad.

El aprendizaje se centra en comprender las razones detrás de cada decisión y no únicamente su implementación.

---

# ¿Por qué un gestor documental?

El dominio elegido corresponde a un sistema de gestión documental.

No fue seleccionado por su complejidad funcional, sino porque permite incorporar progresivamente distintos desafíos arquitectónicos sin cambiar el contexto del proyecto.

A medida que el sistema evoluciona aparecen necesidades como:

- almacenamiento de archivos
- procesamiento de documentos
- comunicación entre servicios
- procesamiento asíncrono
- auditoría
- observabilidad
- automatización de infraestructura

Cada uno de estos problemas justifica naturalmente la incorporación de nuevos componentes cloud.

De esta forma el proyecto mantiene una evolución coherente y evita incorporar tecnologías únicamente con fines demostrativos.

---

# Evolución de la arquitectura

La arquitectura del proyecto no permanece estática.

Cada etapa incorpora una nueva responsabilidad al sistema.

La evolución esperada es la siguiente.

## Etapa 0

Backend monolítico.

```
Cliente

↓

NestJS

↓

Prisma

↓

PostgreSQL
```

Objetivo:

Construir una base sólida sobre la cual evolucionar.

---

## Etapa 1

Incorporación de almacenamiento de objetos.

```
Cliente

↓

NestJS

├── PostgreSQL
└── Amazon S3
```

Objetivo:

Desacoplar el almacenamiento de documentos del sistema de archivos.

---

## Etapa 2

Procesamiento mediante funciones serverless.

```
Usuario

↓

API

↓

S3

↓

Lambda
```

Objetivo:

Eliminar procesamiento pesado del flujo principal de la aplicación.

---

## Etapa 3

Procesamiento asíncrono.

```
API

↓

SQS

↓

Workers

↓

Lambda
```

Objetivo:

Evitar bloquear la respuesta al usuario.

---

## Etapa 4

Arquitectura orientada a eventos.

```
Documento procesado

↓

SNS
├── Auditoría
├── Notificaciones
└── Métricas
```

Objetivo:

Reducir el acoplamiento entre componentes.

---

## Etapa 5

Observabilidad.

```
Aplicación

↓

Logs

↓

CloudWatch

↓

Dashboards
```

Objetivo:

Centralizar información para monitorear el sistema.

---

## Etapa 6

Infrastructure as Code.

Toda la infraestructura comienza a definirse mediante Terraform.

El despliegue deja de depender de configuraciones manuales.

---

# Principios de arquitectura

Durante el desarrollo del laboratorio se intenta mantener un conjunto de principios relativamente constantes.

## Arquitectura modular

Cada responsabilidad debe mantenerse aislada del resto del sistema.

El objetivo es facilitar la evolución del proyecto sin introducir dependencias innecesarias.

---

## Bajo acoplamiento

Los distintos componentes deben conocerse lo menos posible.

Siempre que resulte razonable se privilegiarán interfaces, eventos o contratos antes que dependencias directas.

---

## Evolución incremental

La arquitectura crece únicamente cuando el problema lo requiere.

Se evita incorporar componentes "por si acaso".

---

## Simplicidad

Se priorizan soluciones simples y mantenibles antes que arquitecturas excesivamente complejas.

La complejidad debe aparecer únicamente cuando aporta valor.

---

## Aprendizaje basado en problemas

Cada nueva tecnología incorporada responde a una pregunta concreta.

El proyecto intenta responder cuestiones como:

- ¿Cuándo conviene utilizar almacenamiento de objetos?
- ¿Qué problemas resuelve una arquitectura basada en eventos?
- ¿Cuándo utilizar colas?
- ¿Cuándo utilizar funciones serverless?
- ¿Cómo monitorear aplicaciones distribuidas?
- ¿Cómo administrar secretos?
- ¿Cómo automatizar infraestructura?
- ¿Cómo evoluciona un backend hacia una arquitectura cloud?

---

# Decisiones arquitectónicas

Las decisiones importantes tomadas durante el desarrollo del proyecto se documentan de manera independiente.

Consultar:

```
docs/decisions.md
```

---

# Diagramas

Los diagramas de arquitectura utilizados durante el desarrollo podrán encontrarse en:

```
docs/diagrams/
```

Cada diagrama representa el estado del sistema en un momento determinado y permite visualizar cómo evoluciona la arquitectura a medida que se incorporan nuevos componentes.

---

# Alcance

Este laboratorio no pretende convertirse en un producto listo para producción.

Su objetivo consiste en servir como espacio de experimentación para validar decisiones de diseño, comprender nuevos patrones arquitectónicos y consolidar conocimientos relacionados con backend engineering, cloud computing y sistemas distribuidos.

Muchas decisiones tomadas durante el proyecto priorizan el aprendizaje por sobre la optimización o la cobertura funcional del dominio.

Precisamente por ello, cada etapa busca documentar tanto la implementación realizada como las razones que motivaron dicha decisión.

<span style="font-size: 12px;">**[>> Regresar](../README.md)**</span>
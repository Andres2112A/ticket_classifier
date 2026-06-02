# 🎫 Ticket Classifier AI

Sistema inteligente de clasificación de tickets impulsado por IA utilizando Python, FastAPI y modelos de lenguaje (LLMs).

## 🚀 Descripción

Este proyecto automatiza la clasificación de tickets de soporte mediante Inteligencia Artificial. Actualmente es capaz de recibir solicitudes, analizar el contenido del ticket y devolver una clasificación estructurada en formato JSON.

El objetivo es evolucionar este proyecto hacia una plataforma completa de automatización de soporte capaz de priorizar incidencias, enrutar tickets automáticamente y proporcionar analítica operacional en tiempo real.

---

## 🎯 Objetivos del Proyecto

### Estado actual
- Lectura de tickets desde archivos CSV.
- Clasificación mediante LLM.
- Respuestas estructuradas en JSON.
- Manejo básico de errores.
- Logging para monitoreo y depuración.
- API REST construida con FastAPI.
- Documentación automática mediante Swagger UI.

### Próximas etapas
- Clasificación multi-categoría.
- Sistema de puntuación de confianza.
- Procesamiento masivo de tickets.
- Persistencia en bases de datos.
- Dashboard de métricas.
- Integración con sistemas CRM y Help Desk.
- Despliegue en la nube.
- Arquitectura de microservicios.
- Monitoreo y observabilidad.
- Autenticación y control de acceso.

---

## 🏗 Arquitectura Actual

```text
Cliente
   │
   ▼
FastAPI Endpoint
   │
   ▼
Prompt Engineering
   │
   ▼
LLM API (Groq)
   │
   ▼
JSON Parsing
   │
   ▼
Response
```

---

## 📂 Estructura del Proyecto

```text
ticket_classifier/
│
├── app.py              # API FastAPI
├── main.py             # Procesamiento por lotes CSV
├── tickets.csv         # Dataset de entrada
├── results.csv         # Resultados generados
├── .env                # Variables de entorno (no versionar)
├── .gitignore
└── README.md
```

---

## 🛠 Tecnologías Utilizadas

- Python
- FastAPI
- Uvicorn
- Pandas
- OpenAI SDK
- Groq API
- JSON
- Git & GitHub

---

## ⚙️ Instalación

### Clonar repositorio

```bash
git clone https://github.com/Andres2112A/ticket_classifier.git
cd ticket_classifier
```

### Crear entorno virtual

```bash
python3 -m venv venv
source venv/bin/activate
```

### Instalar dependencias

```bash
python3 -m pip install -r requirements.txt
```

### Configurar variables de entorno

Crear un archivo `.env`

```env
GROQ_API_KEY=tu_api_key
```

---

## 🚀 Ejecutar API

```bash
python3 -m uvicorn app:app --reload
```

Abrir:

```text
http://127.0.0.1:8000/docs
```

---

## 📡 Ejemplo de Uso

### Request

```json
{
  "ticket": "Me cobraron dos veces por mi compra"
}
```

### Response

```json
{
  "type": "Error de cobro",
  "priority": "Alta"
}
```

---

## 🔮 Visión del Proyecto

La meta es construir un sistema de automatización de soporte basado en IA capaz de:

- Clasificar tickets automáticamente.
- Detectar urgencia y prioridad.
- Asignar responsables.
- Generar respuestas preliminares.
- Integrarse con plataformas empresariales.
- Escalar a miles de tickets diarios.

---

## 👨‍💻 Autor

Andrés Acosta

Proyecto de aprendizaje enfocado en:
- Inteligencia Artificial aplicada
- Backend Engineering
- APIs REST
- Automatización de procesos
- AI Engineering

# ticket_classifier — contexto para Claude

Clasificador de tickets de soporte: reglas de negocio deterministas + LLM (Groq, `llama-3.1-8b-instant`, cliente OpenAI compatible) + FastAPI + procesamiento por lotes de CSV. Futuro: n8n, SQLite → PostgreSQL.

## Cómo trabajar con Santiago

- Responder en español.
- Avanzar paso a paso, explicando conceptos y líneas de código (está aprendiendo POO, polimorfismo, testing).
- Probar cada componente antes de añadir el siguiente. No asumir que algo propuesto ya está implementado: revisar el archivo.
- Antes de borrar o mover archivos, confirmar.

## Entorno

- macOS Ventura 13.7.8, Intel x64.
- Entorno virtual: `venv/` con Python 3.14.4 (usar este; no borrarlo). `.venv/` no existe.
- Credenciales en `.env` (`GROQ_API_KEY`). Nunca commitear `.env`.
- Docker no está disponible en este Mac.

## Estructura

- `app.py`: FastAPI (`GET /`, `POST /classify`).
- `main.py`: lote `tickets.csv` → `results.csv`.
- `services/classifier.py`: prompt + llamada a Groq + parseo JSON. Ya NO devuelve `priority` (la decide el motor de reglas).
- `services/priority_rules.py`: reglas de prioridad. Hoy tiene `PriorityRule` y `AccountCompromiseRule`; falta el resto de reglas y el motor.
- `test_priority.py`: pruebas temporales (pasarán a tests automatizados).
- `business_rules.md`, `workflow_design.md`: fuente de verdad de reglas y flujo.

## Reglas de negocio clave

- Categorías: PAYMENT, ACCOUNT, DELIVERY, TECHNICAL, OTHER.
- Prioridades con precedencia CRITICAL > HIGH > MEDIUM > LOW.
- CRITICAL: compromiso de cuenta / acceso no autorizado, fraude explícito, caída general.
- HIGH: pago rechazado, cobro duplicado, pedido no entregado/perdido, cuenta bloqueada.
- MEDIUM: problemas de login sin compromiso, reset de contraseña, acceso intermitente, errores individuales de la app.
- LOW: actualizar datos/correo, consultas generales, sugerencias.
- `needs_review` es booleano; el motivo va en un campo aparte `review_reason`.
- Revisión humana si: sospecha de fraude, pago no reconocido, sospecha de acceso no autorizado/compromiso, clasificación ambigua, categoría no determinable, información insuficiente.

## Decisiones que no se deben revertir

- Nunca usar LOW como valor por defecto. Sin coincidencia → `None` (no determinado).
- No reintroducir `confidence` del LLM (no está calibrado).
- Keywords aislados no son criterio suficiente; reglas deterministas para señales claras, LLM para paráfrasis, humano para riesgo/ambigüedad.
- Prioridad y categoría son decisiones separadas.
- Arquitectura V2: una clase por condición de negocio (no por prioridad) que hereda de `PriorityRule(ABC)` con `evaluate(ticket) -> str | None`; un motor recorre la lista de reglas en orden de precedencia (polimorfismo). Después, devolver un `PriorityDecision` (priority, matched_rule, needs_review, reason).

## Problemas conocidos

1. La prioridad no se calcula en el flujo real: se quitó del LLM y `AccountCompromiseRule` no está conectada; `main.py` y `/classify` no devuelven prioridad.
2. El formato de respuesta del prompt ya no incluye `needs_review`, pero `main.py:32` lo lee con `parsed_result["needs_review"]`: posible `KeyError` cuando el LLM responde bien. `/classify` devolvería la respuesta sin ese campo.
3. Prompt del clasificador: la coma tras `summary` en el formato de ejemplo no es JSON válido, sigue la errata "pertencer" y los criterios de `needs_review` no coinciden con `business_rules.md`.
4. Git: en GitHub, `main` solo tiene README+LICENSE y la V1 vive en `master` (historiales separados). El trabajo V2 está en `feature/priority-engine`.
5. `results.csv` de V1: "No puedo iniciar sesión" salió HIGH (debería ser MEDIUM) y el `summary` copia el ticket.

## Plan acordado

1. ~~Asegurar el trabajo: corregir `.gitignore`, rama `feature/priority-engine`, commit y push.~~ Hecho.
2. Corregir el clasificador (`needs_review`, prompt, criterios de revisión). El fallback ya está corregido.
3. ~~`PriorityRule` + `AccountCompromiseRule` y probar: "Mi cuenta fue hackeada" → CRITICAL; "Quiero actualizar mi correo" → None; "Mi pago fue rechazado" → None.~~ Hecho.
4. Resto de reglas, una por una, y el motor con precedencia.
5. Reconectar la prioridad en `main.py` y `/classify`.
6. Convertir los ejemplos de `business_rules.md` en tests automatizados.
7. Ordenar ramas de GitHub (`main` vs `master`).
8. Después: `PriorityDecision`, n8n, persistencia, README.

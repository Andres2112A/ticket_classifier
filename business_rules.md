# Ticket Classifier AI - Business Rules

## Purpose

This document defines the business rules used by the Ticket Classifier AI system.

The objective is to ensure that ticket classification, prioritization, escalation, and automation follow consistent and predictable criteria.

---

# Ticket Processing Flow

1. Receive ticket.
2. Validate ticket content.
3. Determine priority using business rules.
4. Classify category using AI.
5. Generate summary using AI.
6. Determine whether human review is required.
7. Store the result.
8. Return the response.

---

# Priority Rules

## Priority Precedence

When multiple priority conditions apply to the same ticket, the system must assign the highest applicable priority.

Priority order:

CRITICAL > HIGH > MEDIUM > LOW

## CRITICAL

### Priority Logic

A ticket must be assigned CRITICAL priority when it indicates one or more of the following conditions:

- Account compromise or unauthorized access.
- Explicit fraud or confirmed fraudulent activity.
- Complete service outage affecting all or a broad set of users.

When multiple priority conditions apply, CRITICAL takes precedence over all lower priority levels.

### Examples

* "Mi cuenta fue hackeada."
* "Alguien ingresó a mi cuenta sin autorización."
* "El sistema está caído para todos los usuarios."
* "Detecté actividad fraudulenta."

### Keywords

* fraud
* hacked account
* unauthorized access
* account takeover
* security breach
* service outage
* system down

---

## HIGH

### Priority Logic

A ticket must be assigned HIGH priority when it indicates a significant operational or financial impact and does not meet any CRITICAL condition.

Examples of HIGH-priority conditions include:

- Payment failure.
- Duplicate charge.
- Order not delivered.
- Lost order.
- Blocked account.

CRITICAL conditions always take precedence over HIGH.

### Examples

* "Me cobraron dos veces."
* "Mi pago fue rechazado."
* "Mi pedido nunca llegó."
* "No puedo acceder porque mi cuenta está bloqueada."

### Keywords

* duplicate charge
* payment failed
* order not delivered
* lost order
* blocked account

---

## MEDIUM

### Priority Logic

A ticket must be assigned MEDIUM priority when it indicates a partial or limited service issue and does not meet any CRITICAL or HIGH condition.

Examples of MEDIUM-priority conditions include:

- Login problems without evidence of account compromise.
- Password reset requests.
- Intermittent access problems.
- Individual application errors that do not indicate a complete service outage.

CRITICAL and HIGH conditions always take precedence over MEDIUM.

### Examples

* "No puedo iniciar sesión."
* "Necesito cambiar mi contraseña."
* "Tengo problemas de acceso intermitentes."
* "La aplicación presenta errores."

### Keywords

* login issue
* password reset
* partial access
* technical issue
* intermittent access

---

## LOW

General requests that do not prevent normal service usage.

### Priority Logic

A ticket must be assigned LOW priority when it represents a general request, inquiry, or non-critical account update that does not significantly affect service usage and does not meet any CRITICAL, HIGH, or MEDIUM condition.

Examples of LOW-priority conditions include:

- Updating personal information.
- Updating an email address.
- General account inquiries.
- Suggestions or general feedback.

CRITICAL, HIGH, and MEDIUM conditions always take precedence over LOW.

### Examples

* "Quiero actualizar mi correo electrónico."
* "Necesito actualizar mis datos."
* "Tengo una consulta sobre mi cuenta."
* "Quiero realizar una sugerencia."

### Keywords

* update profile
* update email
* account information
* inquiry
* suggestion

---

# Category Rules

The AI model may only classify tickets into the following categories:

* PAYMENT
* ACCOUNT
* DELIVERY
* TECHNICAL
* OTHER

---

# Human Review Rules

A ticket must be escalated for human review when one or more of the following conditions are met:

* Fraud is suspected.
* A payment is not recognized by the customer.
* Unauthorized access is suspected.
* Account compromise is suspected.
* The classification is ambiguous.
* The AI cannot determine a valid category from the available information.
* The ticket contains insufficient information.

---

# Human Review Examples

### Example 1

Ticket:

"No reconozco este pago realizado ayer."

Result:

```json
{
  "type": "PAYMENT",
  "priority": "HIGH",
  "summary": "Customer reports an unrecognized payment.",
  "needs_review": true
}
```

Reason:

Possible fraud or unidentified transaction.

---

### Example 2

Ticket:

"Creo que alguien ingresó a mi cuenta."

Result:

```json
{
  "type": "ACCOUNT",
  "priority": "CRITICAL",
  "summary": "Customer suspects unauthorized account access.",
  "needs_review": true
}
```

Reason:

Potential account compromise.

---

# Expected Output

```json
{
  "type": "PAYMENT",
  "priority": "HIGH",
  "summary": "Customer reports a duplicate charge.",
  "needs_review": false
}
```

---

# Human Review Queue Payload

When a ticket requires human intervention, the system should generate:

```json
{
  "ticket": "No reconozco este pago.",
  "priority": "HIGH",
  "type": "PAYMENT",
  "summary": "Customer reports an unrecognized payment.",
  "needs_review": true,
  "review_reason": "Possible fraud or unidentified transaction."
}
```

---

# Future Improvements

Future versions of the system may include:

* Agent assignment.
* SLA management.
* Customer authentication checks.
* Risk scoring.
* Automated response generation.
* Database persistence.
* Workflow automation with n8n.

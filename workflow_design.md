# Ticket Classifier AI - Workflow Design

## Overview

This document describes the workflow execution logic for the Ticket Classifier AI system.

The workflow combines business rules and AI-based classification to process support tickets.

---

# High-Level Workflow

```text
Webhook
↓
Validate Ticket
↓
Check Empty Ticket
↓
Determine Priority
↓
AI Classification
↓
Parse Response
↓
Human Review Decision
↓
Store Result
↓
Return Response
```

---

# Step 1 - Receive Ticket

Input:

```json
{
  "ticket": "Me cobraron dos veces."
}
```

Source:

* API Request
* Webhook
* Future integrations

---

# Step 2 - Validate Ticket

Purpose:

Verify that the ticket contains valid content.

Validation Rules:

* Ticket must exist.
* Ticket cannot be empty.
* Ticket length must be greater than 5 characters.

Decision:

```text
Valid Ticket?
├─ Yes → Continue
└─ No → Return Error
```

---

# Step 3 - Determine Priority

Purpose:

Assign priority using predefined business rules.

Process Type:

Rule-Based System

Possible Outputs:

* CRITICAL
* HIGH
* MEDIUM
* LOW

Example:

```text
Ticket:
"Mi cuenta fue hackeada."

Priority:
CRITICAL
```

---

# Step 4 - AI Classification

Purpose:

Classify the ticket category.

AI Responsibilities:

* Determine category.
* Generate summary.
* Determine review status.

Expected Output:

```json
{
  "type": "",
  "summary": "",
  "needs_review": false
}
```

Allowed Categories:

* PAYMENT
* ACCOUNT
* DELIVERY
* TECHNICAL
* OTHER

---

# Step 5 - Parse AI Response

Purpose:

Validate and parse AI JSON output.

Decision:

```text
Valid JSON?
├─ Yes → Continue
└─ No → Fallback Response
```

Fallback Response:

```json
{
  "type": "OTHER",
  "summary": "Unable to process ticket.",
  "needs_review": true
}
```

---

# Step 6 - Human Review Decision

Purpose:

Determine whether a support agent must review the ticket.

Decision:

```text
Needs Review?
├─ Yes
│  ↓
│  Send to Review Queue
│
└─ No
   ↓
   Continue
```

Review Queue Payload:

```json
{
  "ticket": "",
  "priority": "",
  "type": "",
  "summary": "",
  "needs_review": true,
  "review_reason": ""
}
```

---

# Step 7 - Store Result

Purpose:

Persist classification results.

Future Storage Options:

* SQLite
* PostgreSQL

Stored Fields:

* Ticket
* Priority
* Type
* Summary
* Needs Review
* Timestamp

---

# Step 8 - Return Response

Purpose:

Return the final classification to the client.

Example Response:

```json
{
  "type": "PAYMENT",
  "priority": "HIGH",
  "summary": "Customer reports a duplicate charge.",
  "needs_review": false
}
```

---

# Future Workflow Extensions

Planned improvements:

* Agent assignment.
* SLA tracking.
* Escalation workflows.
* Email notifications.
* Slack notifications.
* n8n integration.
* PostgreSQL integration.
* Analytics dashboard.

---

# n8n Workflow Mapping

| Workflow Step      | n8n Node               |
| ------------------ | ---------------------- |
| Receive Ticket     | Webhook                |
| Validate Ticket    | IF                     |
| Determine Priority | Switch                 |
| AI Classification  | HTTP Request / AI Node |
| Parse Response     | Code                   |
| Human Review       | IF                     |
| Store Result       | SQLite / PostgreSQL    |
| Return Response    | Respond to Webhook     |

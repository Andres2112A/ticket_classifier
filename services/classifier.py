import json
import os
import logging

from openai import OpenAI
from dotenv import load_dotenv

load_dotenv()

client = OpenAI(
    api_key=os.getenv("GROQ_API_KEY"),
    base_url="https://api.groq.com/openai/v1"
)

def classify_ticket(ticket):

    prompt = f"""
    Clasifica el siguiente ticket.

Ticket:
{ticket}

SOLO puedes usar estas categorías:

PAYMENT
ACCOUNT
DELIVERY
TECHNICAL
OTHER

SOLO puedes usar estas prioridades:

LOW
MEDIUM
HIGH
CRITICAL

needs_review debe ser:

true:
- Si el ticket es ambiguo
- Si la categoria o prioridad no es clara
- SI pofria pertencer a mas de una categoria o prioridad

false:
- Si el ticket es claro y no ambiguo

Responde únicamente JSON válido.

Formato exacto:

{{
    "type": "",
    "priority": "",
    "summary": "",
    "needs_review": false

}}
"""

    response = client.chat.completions.create(
        model="llama-3.1-8b-instant",
        temperature=0,
        messages=[
            {
                "role": "user",
                "content": prompt
            }
        ]
    )

    result = response.choices[0].message.content

    try:
        parsed_result = json.loads(result)

    except Exception as e:

        logging.error(f"Error parsing JSON: {e}")

        parsed_result = {
            "type": "unknown",
            "priority": "unknown",
            "summary": "No summary available",
            "needs_review": false
        }

    return parsed_result
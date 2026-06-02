import logging
from fastapi import FastAPI
from pydantic import BaseModel
import json
import os
from openai import OpenAI
from dotenv import load_dotenv

app = FastAPI()
load_dotenv()

client = OpenAI(
    api_key=os.getenv("GROQ_API_KEY"),
    base_url="https://api.groq.com/openai/v1"
)

class Ticket(BaseModel):
    ticket: str


@app.get("/")
def home():
    return {"message": "API funcionando"}


@app.post("/classify")
def classify(data: Ticket):
    
    result = classify_ticket(data.ticket)

    return result

def classify_ticket(ticket):
    prompt = f"""
    Clasifica este ticket:

    {ticket}

    IMPORTANTE:
- Responde SOLO JSON válido.
- No expliques nada.
- No agregues texto extra.
- No uses markdown.
- No uses ```.

Formato EXACTO:

{{
  "type": "",
  "priority": ""
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
    except:
        logging.error("Error parsing JSON")

        parsed_result= {
        "type":"unknown",
        "priority":"unknown"
        }
    return parsed_result
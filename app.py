import logging
from fastapi import FastAPI
from pydantic import BaseModel

from services.classifier import classify_ticket

app = FastAPI()

class Ticket(BaseModel):
    ticket: str


@app.get("/")
def home():
    return {"message": "API funcionando"}


@app.post("/classify")
def classify(data: Ticket):
    
    result = classify_ticket(data.ticket)

    return result


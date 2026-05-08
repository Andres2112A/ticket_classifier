from openai import OpenAI
from dotenv import load_dotenv
import pandas as pd
import os

# Cargar variables entorno
load_dotenv()

# Cliente Groq
client = OpenAI(
    api_key=os.getenv("GROQ_API_KEY"),
    base_url="https://api.groq.com/openai/v1"
)

# Leer CSV
df = pd.read_csv("tickets.csv")

# Lista resultados
results = []

# Recorrer tickets
for ticket in df["ticket"]:

    prompt = f"""
    Clasifica este ticket:

    {ticket}

    Devuelve:
    - Tipo
    - Prioridad
    """

    response = client.chat.completions.create(
        model="llama-3.1-8b-instant",
        messages=[
            {
                "role": "user",
                "content": prompt
            }
        ]
    )

    result = response.choices[0].message.content

    print("\n===================")
    print(result)

    results.append(result)

# Agregar resultados al dataframe
df["classification"] = results

# Guardar CSV final
df.to_csv("results.csv", index=False)

print("\nProceso completado.")
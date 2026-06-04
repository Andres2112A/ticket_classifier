import pandas as pd
import logging
from dotenv import load_dotenv
from services.classifier import classify_ticket

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

# Cargar variables entorno
load_dotenv()

# Leer CSV
df = pd.read_csv("tickets.csv")

# Lista resultados
types = []
priorities = []
need_reviews = []
summaries = []

for ticket in df["ticket"]:

    parsed_result = classify_ticket(ticket)

    print("\n===================")

    logging.info(parsed_result.get("type"))
    logging.info(parsed_result.get("priority"))
    logging.info(parsed_result.get("needs_review"))
    logging.info(parsed_result.get("summary"))
    types.append(parsed_result["type"])
    priorities.append(parsed_result["priority"])
    need_reviews.append(parsed_result["needs_review"])
    summaries.append(parsed_result["summary"])

# Agregar resultados al dataframe
df["type"] = types
df["priority"] = priorities
df["needs_review"] = need_reviews
df["summary"] = summaries

# Guardar CSV final
df.to_csv("results.csv", index=False)

print("\nProceso completado.")
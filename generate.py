import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["product_id", "name", "price", "healthy"]

def generate_row():

    return {
        "product_id": random.randint(0, 100),
        "name": random.choice(["Latte", "Сappuccino", "Panini with cyplenok", "Ice latte"]),
        "price": random.randint(300, 500),
        "healthy": random.choice(["A", "B", "C"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)
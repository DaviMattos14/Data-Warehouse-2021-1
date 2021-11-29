from os import sep
import sqlite3
from sqlite3.dbapi2 import Row
import pandas as pd

print("--- Migrando dados para o Banco de Dados COVID ---")

conn = sqlite3.connect("COVID.db")
cursor = conn.cursor()

caminho = "teste.txt"

arquivo = pd.read_csv(caminho, sep=";", dtype=str)
insert_inicio = """
INSERT INTO Casos (municipio, NUM_CASOS, DATA_CASOS, codIBGE, urs, MICRO, regiao)
VALUES
"""
values = ",".join(
    [
        "('{}', '{}', '{}', '{}', '{}', '{}', '{}')".format(
            row[0], row[1], row[2], row[3], row[4], row[5], row[6]
        )
        for id, row in arquivo.iterrows()
    ]
)

query = insert_inicio + values

conn.execute(query)
conn.commit()
conn.close()

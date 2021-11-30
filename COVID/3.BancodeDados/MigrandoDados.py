from os import sep
import sqlite3
from sqlite3.dbapi2 import Row
import pandas as pd

print("--- Migrando dados para o Banco de Dados COVID ---")


def inserirDados(arquivo):
    conn = sqlite3.connect("COVID_MG.db")
    cursor = conn.cursor()
    inicio_insert_localidade = """
    INSERT INTO Localidade ( MUNIC_RESIDENCIA, COD_IBGE, URS, MICRO, MACRO)
    VALUES
    """
    values_localidade = ",".join(
        [
            "('{}', '{}', '{}', '{}', '{}')".format(
                row[0], row[3], row[4], row[5], row[6]
            )
            for id, row in arquivo.iterrows()
        ]
    )
    fim_insert_localidade = """
    ON CONFLICT (MUNIC_RESIDENCIA) DO NOTHING;
    """
    query_localidae = (
        inicio_insert_localidade + values_localidade + fim_insert_localidade
    )
    conn.execute(query_localidae)
    conn.commit()
    conn.close()


arquivo_casos = pd.read_csv(
    "/Users/conta/Desktop/Data-Warehouse-2021-1/COVID/1. Coleta de Dados/DADOS_COVID-19_MG/CSV_Painel_CONFIRMADOS.csv",
    sep=";",
    dtype=str,
)
arquivo_internados = pd.read_csv(
    "/Users/conta/Desktop/Data-Warehouse-2021-1/COVID/1. Coleta de Dados/DADOS_COVID-19_MG/CSV_Painel_INTERNADOS.csv",
    sep=";",
    dtype=str,
)
arquivo_obitos = pd.read_csv(
    "/Users/conta/Desktop/Data-Warehouse-2021-1/COVID/1. Coleta de Dados/DADOS_COVID-19_MG/CSV_Painel_OBITOS.csv",
    sep=";",
    dtype=str,
)
arquivo_recuperados = pd.read_csv(
    "/Users/conta/Desktop/Data-Warehouse-2021-1/COVID/1. Coleta de Dados/DADOS_COVID-19_MG/CSV_Painel_RECUPERADOS.csv",
    sep=";",
    dtype=str,
)
inserirDados(arquivo_casos)
inserirDados(arquivo_internados)
inserirDados(arquivo_obitos)
inserirDados(arquivo_recuperados)
print("--- Migrando dados para o Banco de Dados COVID ---")

conn = sqlite3.connect("COVID.db")
cursor = conn.cursor()

caminho = "teste.txt"

conn = sqlite3.connect("COVID_MG.db")

conn = sqlite3.connect("COVID_MG.db")
cursor = conn.cursor()


inicio_query_casos = """
INSERT INTO tabela_fatos (NUM_CASOS,  DATA_, Localidade_MUNIC_RESIDENCIA)
"""

inicio_query_internados = """
INSERT INTO tabela_fatos (NUM_INTERNADOS, DATA_, Localidade_MUNIC_RESIDENCIA)
"""

inicio_query_obitos = """
INSERT INTO tabela_fatos (NUM_OBITOS, DATA_, Localidade_MUNIC_RESIDENCIA)
"""

inicio_query_recuperados = """
INSERT INTO tabela_fatos (NUM_RECUPERADOS, DATA_, Localidade_MUNIC_RESIDENCIA)
"""

values_casos = ",".join(
    [
        "('{}', '{}', '{}')".format(row[1], row[2], row[0])
        for id, row in arquivo_casos.iterrows()
    ]
)
values_internados = ",".join(
    [
        "('{}', '{}', '{}')".format(row[1], row[2], row[0])
        for id, row in arquivo_internados.iterrows()
    ]
)
values_obitos = ",".join(
    [
        "('{}', '{}', '{}')".format(row[1], row[2], row[0])
        for id, row in arquivo_obitos.iterrows()
    ]
)
values_recuperados = ",".join(
    [
        "('{}', '{}', '{}')".format(row[1], row[2], row[0])
        for id, row in arquivo_recuperados.iterrows()
    ]
)

query_casos = inicio_query_casos + values_casos
query_internados = inicio_query_internados + values_internados
query_obitos = inicio_query_obitos + values_obitos
query_recuperados = inicio_query_recuperados + values_recuperados

conn.execute(query_casos)
conn.execute(query_internados)
conn.execute(query_obitos)
conn.execute(query_recuperados)
conn.commit()
conn.close()

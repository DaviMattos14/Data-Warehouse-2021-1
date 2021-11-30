import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score
from sklearn.model_selection import train_test_split
import plotly.express as px


st.header(
    "Interface para visualização e aprendizado de dados do COVID-19 de Minas Gerais"
)
st.subheader("Selecione qual informação queira visualizar abaixo")

report_type = st.selectbox(
    "Selecione:", ["Visualização de dados", "Aprendizagem de dados"]
)


def visualizacao_dados():

    # df = pd.read_sql()

    st.subheader("1. Qual foi a média de casos de cada mês?")
    fig = px.box(df, x="time", y="total_bill", points="all")
    st.plotly_chart(fig)
    st.text("O mês com maior média de casos foi o de  ")

    st.subheader("2. Qual foi a média de óbitos de cada mês?")
    fig = px.box(df, x="time", y="total_bill", points="all")
    st.plotly_chart(fig)
    st.text("O mês com maior média de casos foi o de  ")

    st.subheader("3. Qual foi a localidade com maior número de casos?")
    fig = px.box(df, x="time", y="total_bill", points="all")
    st.plotly_chart(fig)
    st.text("O mês com maior média de casos foi o de  ")

    st.subheader("4. Qual foi a localidade com maior número de óbtidos?")
    fig = px.box(df, x="time", y="total_bill", points="all")
    st.plotly_chart(fig)
    st.text("O mês com maior média de casos foi o de  ")

    st.subheader("5. Qual foi a média de internação de cada mês?")
    fig = px.box(df, x="time", y="total_bill", points="all")
    st.plotly_chart(fig)
    st.text("O mês com maior média de casos foi o de  ")


def linear_regression(test_size):
    # Load the diabetes dataset
    x_train, x_test, y_train, y_test = train_test_split(
        x, y, test_size=0.33, random_state=42
    )
    # Treinando modelo
    model = LinearRegression().fit(x_train, y_train)
    y_pred = LinearRegression().predict(x_test)

    # Score do modelo
    # The coefficient of determination: 1 is perfect prediction
    r_sq = model.score(x, y)
    st.text("coefficient of determination:", r_sq)
    st.text("slope:", model.coef_)

    # Plotando dado real + previsão
    plt.scatter(x_test, y_test, color="black")
    plt.plot(x_test, y_pred, color="blue", linewidth=3)
    plt.xticks(())
    plt.yticks(())
    plt.show()


def aprendizagem_dados():
    st.subheader("Predição dos dados de Dezembro com Regressão Linear")
    test_size = st.slider("Qual tamanho você quer para os dados de test?", 0, 1, 0.33)
    # linear_regression(test_size)


if report_type == "Visualização de dados":
    visualizacao_dados()
else:
    aprendizagem_dados()

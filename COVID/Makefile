run-seed-covid: 
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	clear
	python3 1.ColetaDeDados/BaixarDadosCOVID.py

run-create-covid:
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	clear
	python3 3.BancodeDados/CriandoBancoDados.py

run-migrate-covid:
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	python3 3.BancodeDados/MigrandoDados.py
	clear

run-create-seed-migrate-covid:
	make run-seed-covid
	make run-create-covid
	make run-migrate-covid

run-streamlit-covid:
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	clear
	streamlit run 4.VisualizacaoLearningDados/InterfaceStreamlit.py
run-seed: 
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	clear
	python3 1.ColetaDeDados/BaixarArquivosEnade.py

run-create:
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	clear
	python3 3.BancodeDados/CriandoBancoDados.py

run-migrate:
	python3 -m venv .venv
	bash -c "source .venv/bin/activate"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	clear

run-create-seed-migrate:
	make run-seed
	make run-create
	make run-migrate


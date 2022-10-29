jupyter:
	poetry run jupyter notebook \
	--allow-root \
	--no-browser \
	--ip 0.0.0.0 \
	--NotebookApp.token='' \
	notebook

check_notebook:
	autoflake -i -r --remove-all-unused-imports $(path)
	black --line-length=79 $(path)

check_code:
	autoflake -i -r --remove-all-unused-imports $(path)
	black --line-length=79 $(path)
	isort $(path)
	flake8 --show-source $(path)
	mypy --strict $(path)

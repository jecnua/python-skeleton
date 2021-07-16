test:
	pipenv run pylint src/
	pipenv run python -m unittest tests/test_app.py

develop: test
	@echo ""
	@LOG_LEVEL=DEBUG pipenv run python src/app.py

run:
	@LOG_LEVEL=INFO pipenv run python src/app.py
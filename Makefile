
lint:
	pylint --rcfile=./.pylintrc ./platformio

isort:
	isort -rc ./platformio
	isort -rc ./tests

yapf:
	yapf --recursive --in-place platformio/

before-commit: isort yapf lint

clean-docs:
	rm -rf docs/_build

clean: clean-docs
	find . -name \*.pyc -delete
	find . -name __pycache__ -delete
	rm -rf .cache
	rm -rf build
	rm -rf htmlcov
	rm -f .coverage
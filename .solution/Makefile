.PHONY: run

help:
	@echo ''
	@echo 'usage: make [target]'
	@echo ''
	@echo 'targets:'
	@echo '  help          - prints this message'
	@echo '  run           - runs app'
	@echo '  build         - builds docker images'
	@echo '  dev           - create development env, install all requirements'
	@echo '  test          - run all tests (test-*)'
	@echo '  test-doctest  - run all doctests'
	@echo '  test-unit     - run all unit tests'
	@echo '  test-coverage - compute test coverage'
	@echo '  test-security - test security with bandit'
	@echo '  test-types    - test type annotatios'
	@echo '  test-style    - test code style'
	@echo '  test-lint     - lint your code'
	@echo '  test-static   - run all static code analysis'

run:
	@python3 src/__main__.py

build:
	docker build . -t localhost:5000/myapp:$$(git log -1 --format=%h)
	docker push -t localhost:5000/myapp:$$(git log -1 --format=%h)
	docker rmi localhost:5000/myapp:$$(git log -1 --format=%h)

dev:
	python3 -m pip install --upgrade -r requirements.dev

test-doctest:
	python3 -m doctest -v test/*.py

test-unit:
	python3 -m unittest discover -v test

test-coverage:
	python3 -m coverage run src
	python3 -m coverage xml -o .tmp/coverage.xml

test-security:
	-python3 -m bandit --format json --output=.tmp/bandit.json --recursive src

test-types:
	-python3 -m mypy --ignore-missing-imports --cobertura-xml-report=.tmp src

test-style:
	-python3 -m flake8 --doctest --output-file=.tmp/flake8.txt src

test-lint:
	-python3 -m pylint --output-format=parseable --output=.tmp/pylint.txt --disable=C0114,C0115,C0116,E0401,C0103 src

test-static:
	docker run --rm --net=ecosystem -v $(PWD):/usr/src sonarsource/sonar-scanner-cli

test: \
	test-doctest \
	test-unit \
	test-coverage \
	test-security \
	test-types \
	test-style \
	test-lint \
	test-static

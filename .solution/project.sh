#!/bin/bash
set -e
set -x

# if SONARQUBE_TOKEN is not set, exit with error
[ "$SONARQUBE_TOKEN" == "" ] && exit 1


cd /home/ubuntu/src
python3 -m venv .venv
. .venv/bin/activate

echo -n > requirements.dev
echo -n > requirements.prod
ln -s Dockerfile.multistage Dockerfile

mkdir -p run/
echo 'echo Not Implemented' > run/all
echo 'echo Not Implemented' > run/build-debug
echo 'echo Not Implemented' > run/build-envvars
echo 'echo Not Implemented' > run/build-dependencies
echo 'echo Not Implemented' > run/build-compile
echo 'echo Not Implemented' > run/test-all
echo 'echo Not Implemented' > run/test-codestyle
echo 'echo Not Implemented' > run/test-coverage
echo 'echo Not Implemented' > run/test-documentation
echo 'echo Not Implemented' > run/test-functional
echo 'echo Not Implemented' > run/test-formatter
echo 'echo Not Implemented' > run/test-integration
echo 'echo Not Implemented' > run/test-lint
echo 'echo Not Implemented' > run/test-load
echo 'echo Not Implemented' > run/test-mutation
echo 'echo Not Implemented' > run/test-regression
echo 'echo Not Implemented' > run/test-security
echo 'echo Not Implemented' > run/test-smoke
echo 'echo Not Implemented' > run/test-static
echo 'echo Not Implemented' > run/test-typing
echo 'echo Not Implemented' > run/test-ui
echo 'echo Not Implemented' > run/test-unit
echo 'echo Not Implemented' > run/test-report
echo 'echo Not Implemented' > run/image-compile
echo 'echo Not Implemented' > run/image-build
echo 'echo Not Implemented' > run/image-push
echo 'echo Not Implemented' > run/image-remove
echo 'echo Not Implemented' > run/deploy-dev
echo 'echo Not Implemented' > run/deploy-test
echo 'echo Not Implemented' > run/deploy-preprod
echo 'echo Not Implemented' > run/deploy-prod
chmod +x run/*

cat > Dockerfile.singlestage << EOF

FROM python:3.12-alpine
WORKDIR /data
ENV PYTHONPATH=src
COPY requirements.prod /data/requirements.prod
RUN pip install --upgrade --no-cache-dir -r /data/requirements.prod
COPY src /data/src
COPY test /data/test
COPY run /data/run
CMD python3 /data/src/__main__.py

EOF

cat > Dockerfile.multistage << EOF

## Set build environment
FROM python:3.12-alpine AS build
ENV PYTHONPATH=src
WORKDIR /data

## Copy files
COPY requirements.prod /data/requirements.prod
COPY src /data/src
COPY test /data/test
COPY run /data/run

## Setup Env
RUN run/build-debug
RUN run/build-envvars
RUN run/build-dependencies
RUN run/build-compile

## Run tests
RUN run/test-codestyle
RUN run/test-coverage
RUN run/test-documentation
RUN run/test-formatter
RUN run/test-functional
RUN run/test-integration
RUN run/test-lint
RUN run/test-load
# RUN run/test-mutation
RUN run/test-regression
RUN run/test-security
RUN run/test-smoke
RUN run/test-static
RUN run/test-typing
RUN run/test-ui
RUN run/test-unit

## Create executable
RUN run/image-compile

## Prepare production ready Image
FROM python:3.12-alpine
COPY --from=build /data/game.pyz /game.pyz
CMD python3 /game.pyz

EOF

cat > sonar-project.properties << EOF

## Sonar Server
sonar.host.url=http://sonarqube:9000/
sonar.login=$SONARQUBE_TOKEN

## Software Configuration Management
sonar.scm.enabled=true
sonar.scm.provider=git

## SonarScanner Config
sonar.sourceEncoding=UTF-8
sonar.verbose=false
sonar.log.level=INFO
sonar.showProfiling=false
sonar.projectBaseDir=/usr/src/
sonar.working.directory=/tmp/

## Quality Gates
sonar.qualitygate.wait=true
sonar.qualitygate.timeout=300

## Python Project
sonar.projectKey=mypythonproject
sonar.projectName=MyPythonProject

## Python Config
sonar.language=py
sonar.python.version=3.12
sonar.sources=src
sonar.tests=test
sonar.inclusions=**/*.py
sonar.exclusions=**/migrations/**,**/*.pyc,**/__pycache__/**

## Python Tools
sonar.python.xunit.skipDetails=false
sonar.python.xunit.reportPath=.tmp/xunit.xml
sonar.python.coverage.reportPaths=.tmp/coverage.xml,.tmp/cobertura.xml
sonar.python.bandit.reportPaths=.tmp/bandit.json
sonar.python.pylint.reportPaths=.tmp/pylint.txt
sonar.python.flake8.reportPaths=.tmp/flake8.txt

EOF

cat > Jenkinsfile << EOF

pipeline {
  triggers { pollSCM('* * * * *') }
  agent any

  stages {
    stage('Build Debug')          { steps { sh 'run/build-debug' }}
    stage('Build Envvars')        { steps { sh 'run/build-envvars' }}
    stage('Build Requirements')   { steps { sh 'run/build-dependencies' }}
    stage('Build Setup')          { steps { sh 'run/build-compile' }}

    stage('Test') {
    parallel {
        stage('Test Codestyle')     { steps { sh 'run/test-codestyle' }}
        stage('Test Coverage')      { steps { sh 'run/test-coverage' }}
        stage('Test Documentation') { steps { sh 'run/test-documentation' }}
        stage('Test Functional')    { steps { sh 'run/test-functional' }}
        stage('Test Formatter')     { steps { sh 'run/test-formatter' }}
        stage('Test Integration')   { steps { sh 'run/test-integration' }}
        stage('Test Lint')          { steps { sh 'run/test-lint' }}
        stage('Test Load')          { steps { sh 'run/test-load' }}
        stage('Test Mutation')      { steps { sh 'run/test-mutation' }}
        stage('Test Regression')    { steps { sh 'run/test-regression' }}
        stage('Test Security')      { steps { sh 'run/test-security' }}
        stage('Test Smoke')         { steps { sh 'run/test-smoke' }}
        stage('Test Static')        { steps { sh 'run/test-static' }}
        stage('Test Typing')        { steps { sh 'run/test-typing' }}
        stage('Test UI')            { steps { sh 'run/test-ui' }}
        stage('Test Unit')          { steps { sh 'run/test-unit' }}
    }}
    stage('Test Report')            { steps { sh 'run/test-report' }}

    stage('Image Build')            { steps { sh 'run/image-build' }}
    stage('Image Push')             { steps { sh 'run/image-push' }}
    stage('Image Remove')           { steps { sh 'run/image-remove' }}

    stage('Deploy Dev')             { steps { sh 'run/deploy-dev' }}
    stage('Deploy Test')            { steps { sh 'run/deploy-test' }}
    stage('Deploy Preprod')         { steps { sh 'run/deploy-preprod' }}
    stage('Deploy Prod')            { steps { sh 'run/deploy-prod' }}
  }
}

EOF

cat > pyproject.toml << EOF

[tool.ruff]
target-version = "py312"
line-length = 88
indent-width = 4

exclude = [
    ".bzr",
    ".direnv",
    ".eggs",
    ".git",
    ".git-rewrite",
    ".hg",
    ".mypy_cache",
    ".nox",
    ".pants.d",
    ".pytype",
    ".ruff_cache",
    ".svn",
    ".tox",
    ".venv",
    "__pypackages__",
    "_build",
    "buck-out",
    "build",
    "dist",
    "node_modules",
    "venv",
]

[tool.ruff.lint]
# Enable Pyflakes ("F") and a subset of the pycodestyle ("E")  codes by default.
# Unlike Flake8, Ruff doesn't enable pycodestyle warnings ("W") or
# McCabe complexity ("C901") by default.
select = ["E4", "E7", "E9", "F"]
ignore = []

# Allow fix for all enabled rules (when "--fix") is provided.
fixable = ["ALL"]

[tool.ruff.format]
quote-style = "single"
indent-style = "space"
skip-magic-trailing-comma = false
line-ending = "auto"

EOF

cat > run/all << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Run all build steps"
grep -Po "^[^/].*sh '\K.+(?=')" Jenkinsfile |sh -x

EOF


cat > run/test-all << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Run all tests"
grep -Po "^[^/].*sh '\K.+(?=')" Jenkinsfile |grep run/test |sh -x

EOF

cat > run/build-envvars << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src
export PYTHONWARNINGS=always
export PYTHONDEBUG=1
export PYTHONASYNCIODEBUG=1
export PYTHONDEVMODE=1
export PYTHONMALLOC=debug

EOF

cat > run/build-dependencies << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Upgrade pip"
python3 -m pip install --upgrade --no-cache-dir pip

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir -r requirements.prod

EOF

cat > run/build-debug << EOF

echo ""
echo "OS configuration:"
echo "Hostname: \$(hostname)"
echo "PWD: \$(pwd)"
echo "Whoami: \$(whoami)"
echo "ID: \$(id)"
echo "PATH: \$(echo \$PATH)"

echo ""
echo "Python configuration: "
echo "Executable: \$(which python3)"
echo "Version: \$(python3 --version)"

echo ""
echo "Debugging:"
echo "For Debug uncomment line with sleep:"
# sleep 3600

echo ""
echo "While build is on hold, execute:"
echo docker exec -it -u \$(whoami) --workdir "\$(pwd)" \$(hostname) sh

EOF

cat > run/test-unit << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Run analysis"
python3 -m unittest discover -v test

EOF

cat > run/test-integration << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Run analysis"
python3 -m doctest -v test/*.py

EOF

cat > run/test-security << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Create output directory"
mkdir -p .tmp

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir bandit

echo "Fail build if high severity bugs are discovered"
python3 -m bandit --exclude test --skip B311 --recursive src --silent --severity-level high

echo ""
echo "Pass build if not high severity bugs are discovered"
echo "Report will be uploaded to SonarQube"
python3 -m bandit --exclude test --skip B311 --recursive src --format json --output=.tmp/bandit.json --exit-zero

echo ""
echo "Show test output"
cat .tmp/bandit.json

EOF

cat > run/test-coverage << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Create output directory"
mkdir -p .tmp

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir coverage

echo "Run analysis"
python3 -m coverage run src

echo "Create reports"
python3 -m coverage report
python3 -m coverage xml -o .tmp/coverage.xml

EOF

cat > run/test-codestyle << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Create output directory"
mkdir -p .tmp

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir flake8

echo "Run tests"
python3 -m flake8 --doctest --output-file=.tmp/flake8.txt src

echo "Display report"
cat .tmp/flake8.txt

EOF

cat > run/test-documentation << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Create output directory"
mkdir -p .tmp

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir pydocstyle tomli

echo "Run analysis"
python3 -m pydocstyle src/ || true

EOF

cat > run/test-lint << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Create output directory"
mkdir -p .tmp

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir pylint

echo "Run analysis"
python3 -m pylint --exit-zero --msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}" --output=.tmp/pylint.txt --disable=C0114,C0115,C0116,E0401,C0103 src

EOF


cat > run/test-static << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Create output directory"
mkdir -p .tmp

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir pylama

echo "Run analysis"
python3 -m pylama src --linters 'eradicate,mccabe,mypy,pycodestyle,pydocstyle,pyflakes,pylint,isort' --ignore C100,D101,D102,D107,C113,C0114,C115,C0116,D105,C0115,D100,D103,D106,D104 --skip .venv --format pylint --report .tmp/pylama.txt || true

echo "Display results"
cat .tmp/pylama.txt

EOF


cat > run/test-formatter << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir ruff

echo "Run analysis"
python3 -m ruff check src/

EOF

cat > run/test-typing << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Create output directory"
mkdir -p .tmp

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir mypy lxml

echo "Run analysis"
python3 -m mypy --ignore-missing-imports --cobertura-xml-report=.tmp src || true

EOF

cat > run/test-mutation << EOF
echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Create output directory"
mkdir -p .tmp

echo "Clear cache from previous analysis"
rm -fr .mutmut-cache

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir mutmut

echo "Run analysis"
python3 -m mutmut run --simple-output --paths-to-mutate src --tests-dir test || true

echo "Create reports"
python3 -m mutmut results
python3 -m mutmut junitxml --suspicious-policy=ignore --untested-policy=ignore > .tmp/xunit.xml

EOF

cat > run/test-report << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Run analysis"
docker run --rm --net=ecosystem -v \$(pwd):/usr/src sonarsource/sonar-scanner-cli

EOF

cat > run/image-compile << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Install all dependencies inside src folder"
python3 -m pip install --upgrade --no-cache-dir -r requirements.prod --target src

echo "Remove not needed .dist-info files"
rm -fr src/*.dist-info

echo "Compile all .py files into .pyc"
python3 -m compileall -f src

# echo "Remove all .py files (it should work perfectly fine only with .pyc files"
# find src -name '*.py' -not -name '__main__.py' -not -name '__init__.py' -delete  # not working for now

echo "Collect all files (and dependencies) into .pyz file (uncompressed zip archive)"
python3 -m zipapp --python="/usr/bin/env python3" --output=game.pyz src

EOF

cat > run/image-build << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Build Docker image based on the current repository state (git commit)"
docker build --pull . -t localhost:5000/myapp:\$(git log -1 --format='%h')

EOF

cat > run/image-push << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Upload Docker image to the binary repisitory (Registry)"
docker push localhost:5000/myapp:\$(git log -1 --format='%h')

EOF

cat > run/image-remove << EOF

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Remove temporary build image"
docker rmi localhost:5000/myapp:\$(git log -1 --format='%h')

EOF

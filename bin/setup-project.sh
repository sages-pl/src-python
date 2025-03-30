#!/bin/bash
# Mind, that this is a bash script for Ubuntu 24.04 LTS
# run: bash project.sh

SONARQUBE_TOKEN="your-sonarqube-token"
IP=$(curl -s ipecho.net/plain)

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

# if SONARQUBE_TOKEN is not set, exit with error
[ "$SONARQUBE_TOKEN" = "" ] && exit 1


# Directory
# ---------
rm -fr /home/ubuntu/src
mkdir -p /home/ubuntu/src
git clone https://github.com/sages-pl/src-python.git /home/ubuntu/src

cd /home/ubuntu/src
git config --global --add safe.directory /home/ubuntu/src
git remote set-url origin http://root:abcdefghi@$IP:3000/root/src-python.git


# Dependencies
# ------------
cd /home/ubuntu/src
sudo apt install -y python3-pip
sudo apt install -y python3-venv
python3 -m venv .venv
. .venv/bin/activate

echo -n > requirements.txt
echo -n > requirements.lock


# Run Files
# ---------
mkdir -p run/
echo 'echo Not Implemented' > run/all
echo 'echo Not Implemented' > run/about
echo 'echo Not Implemented' > run/build-envvars
echo 'echo Not Implemented' > run/build-dependencies
echo 'echo Not Implemented' > run/build-compile
echo 'echo Not Implemented' > run/test-all
echo 'echo Not Implemented' > run/test-codestyle
echo 'echo Not Implemented' > run/test-coverage
echo 'echo Not Implemented' > run/test-documentation
echo 'echo Not Implemented' > run/test-formatter
echo 'echo Not Implemented' > run/test-functional
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
echo 'echo Not Implemented' > run/report
echo 'echo Not Implemented' > run/image-compile
echo 'echo Not Implemented' > run/image-build
echo 'echo Not Implemented' > run/image-push
echo 'echo Not Implemented' > run/image-remove
echo 'echo Not Implemented' > run/deploy-dev
echo 'echo Not Implemented' > run/deploy-test
echo 'echo Not Implemented' > run/deploy-preprod
echo 'echo Not Implemented' > run/deploy-prod
chmod +x run/*


# Dockerfile
# ----------
cat > Dockerfile.singlestage << EOF

FROM python:3.12-alpine
WORKDIR /data
ENV PYTHONPATH=src
COPY requirements.lock /data/requirements.lock
RUN pip install --upgrade --no-cache-dir -r /data/requirements.lock
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
COPY requirements.lock /data/requirements.lock
COPY src /data/src
COPY test /data/test
COPY run /data/run

## Setup Env
RUN run/about
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
RUN run/test-mutation
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
COPY --from=build /data/myapp.pyz /myapp.pyz
CMD python3 /myapp.pyz

EOF

ln -s Dockerfile.multistage Dockerfile


# Sonar Properties
# ----------------
cat > sonar-project.properties << EOF

## Sonar Server
sonar.host.url=http://sonarqube:9000/
sonar.token=$SONARQUBE_TOKEN

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
sonar.projectKey=myproject
sonar.projectName=MyProject
sonar.projectVersion=1.0.0

## Python Config
sonar.language=py
sonar.python.version=3.12
sonar.sources=src
sonar.tests=test
sonar.inclusions=**/*.py
sonar.exclusions=**/migrations/**,**/*.pyc,**/__pycache__/**
sonar.python.file.suffixes=py
sonar.ipynb.file.suffixes=ipynb

## Python Tools
sonar.python.xunit.skipDetails=false
sonar.python.xunit.reportPath=.tmp/xunit.xml
sonar.python.coverage.reportPaths=.tmp/coverage.xml,.tmp/cobertura.xml
sonar.python.bandit.reportPaths=.tmp/bandit.json
sonar.python.mypy.reportPaths=.tmp/index.xml
sonar.python.pylint.reportPaths=.tmp/pylint.txt
sonar.python.flake8.reportPaths=.tmp/flake8.txt
sonar.python.ruff.reportPaths=.tmp/ruff.xml

## Documentation
# https://docs.sonarsource.com/sonarqube-server/latest/analyzing-source-code/analysis-parameters/

EOF


# Jenkinsfile
# -----------
cat > Jenkinsfile << EOF

pipeline {
  triggers {pollSCM('* * * * *')}
  agent any

  stages {
    stage('About')           {steps{ sh 'run/about' }}

    stage('Build') {stages {
      stage('Envvars')       {steps{ sh 'run/build-envvars' }}
      stage('Dependencies')  {steps{ sh 'run/build-dependencies' }}
      stage('Compile')       {steps{ sh 'run/build-compile' }}
    }}

    stage('Test') {parallel {
      stage('Codestyle')     {steps{ sh 'run/test-codestyle' }}
      stage('Coverage')      {steps{ sh 'run/test-coverage' }}
      stage('Documentation') {steps{ sh 'run/test-documentation' }}
      stage('Formatter')     {steps{ sh 'run/test-formatter' }}
      stage('Functional')    {steps{ sh 'run/test-functional' }}
      stage('Integration')   {steps{ sh 'run/test-integration' }}
      stage('Lint')          {steps{ sh 'run/test-lint' }}
      stage('Load')          {steps{ sh 'run/test-load' }}
      stage('Mutation')      {steps{ sh 'run/test-mutation' }}
      stage('Regression')    {steps{ sh 'run/test-regression' }}
      stage('Security')      {steps{ sh 'run/test-security' }}
      stage('Smoke')         {steps{ sh 'run/test-smoke' }}
      stage('Static')        {steps{ sh 'run/test-static' }}
      stage('Typing')        {steps{ sh 'run/test-typing' }}
      stage('UI')            {steps{ sh 'run/test-ui' }}
      stage('Unit')          {steps{ sh 'run/test-unit' }}
    }}

    stage('Report')            { steps { sh 'run/report' }}

    stage('Image') {stages {
      stage('Build')         {steps{ sh 'run/image-build' }}
      stage('Push')          {steps{ sh 'run/image-push' }}
      stage('Remove')        {steps{ sh 'run/image-remove' }}
    }}

    stage('Deploy') {stages {
      stage('Dev')           {steps{ sh 'run/deploy-dev' }}
      stage('Test')          {steps{ sh 'run/deploy-test' }}
      stage('Preprod')       {steps{ sh 'run/deploy-preprod' }}
      stage('Prod')          {steps{ sh 'run/deploy-prod' }}
    }}
  }
}

EOF


# Pyproject TOML
# --------------
cat > pyproject.toml << EOF

[project]
name = "myproject"
version = "1.0.0"
requires-python = ">=3.12"
readme = "README.md"
keywords = ["ares", "mars", "nasa", "human-spaceflight"]
authors = [{name = "John Doe", email = "jdoe@example.com"}]
license = {file = "LICENSE"}
classifiers = [
    "Development Status :: 3 - Alpha",
    "Environment :: Console",
    "Intended Audience :: System Administrators",
    "Intended Audience :: Developers",
    "License :: OSI Approved :: GNU General Public License v2 (GPLv2)",
    "Operating System :: OS Independent",
    "Programming Language :: Python",
    "Programming Language :: Python :: 3",
    "Programming Language :: Python :: 3 :: Only",
    "Programming Language :: Python :: 3.12",
    "Programming Language :: Python :: 3.13",
    "Topic :: Software Development :: Libraries :: Application Frameworks",
    "Topic :: Software Development :: Libraries :: Python Modules",
    "Topic :: Software Development :: Build Tools",
    "Topic :: Software Development :: Testing",
    "Topic :: Software Development :: Version Control",
    "Topic :: Software Development :: Quality Assurance",
    "Topic :: System :: Software Distribution",
]

[project.urls]
homepage = "https://github.com/myusername/myproject"
documentation = "https://github.com/myusername/myproject"
repository = "https://github.com/myusername/myproject.git"
changelog = "https://github.com/myusername/myproject/releases"
bugtracker = "https://github.com/myusername/myproject/issues"

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


# Run All
# -------
cat > run/all << EOF
#!/bin/sh

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

run/about
run/build-envvars
run/build-dependencies
run/build-compile
run/test-all
run/test-codestyle
run/test-coverage
run/test-documentation
run/test-formatter
run/test-functional
run/test-integration
run/test-lint
run/test-load
run/test-mutation
run/test-regression
run/test-security
run/test-smoke
run/test-static
run/test-typing
run/test-ui
run/test-unit
run/report
run/image-compile
run/image-build
run/image-push
run/image-remove
run/deploy-dev
run/deploy-test
run/deploy-preprod
run/deploy-prod

EOF


# Test All
# --------
cat > run/test-all << EOF
#!/bin/sh

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

run/test-codestyle
run/test-coverage
run/test-documentation
run/test-formatter
run/test-functional
run/test-integration
run/test-lint
run/test-load
run/test-mutation
run/test-regression
run/test-security
run/test-smoke
run/test-static
run/test-typing
run/test-ui
run/test-unit

EOF


# About
# -----
cat > run/about << EOF
#!/bin/sh

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


# Build Envvars
# -------------
cat > run/build-envvars << EOF
#!/bin/sh

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


# Build Dependencies
# ------------------
cat > run/build-dependencies << EOF
#!/bin/sh

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Upgrade pip"
python3 -m pip install --upgrade --no-cache-dir pip

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir -r requirements.lock

EOF


# Test Unit
# ---------
cat > run/test-unit << EOF
#!/bin/sh

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Run analysis"
python3 -m unittest discover -v test

EOF


# Test Integration
# ----------------
cat > run/test-integration << EOF
#!/bin/sh

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Run analysis"
python3 -m doctest -v test/*.py

EOF


# Test Security
# -------------
cat > run/test-security << EOF
#!/bin/sh

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
echo "Show the results"
cat .tmp/bandit.json

EOF


# Test Coverage
# -------------
cat > run/test-coverage << EOF
#!/bin/sh

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

echo "Run coverage analysis"
python3 -m coverage run src

echo "Gather reports"
python3 -m coverage report
python3 -m coverage xml -o .tmp/coverage.xml

echo ""
echo "Show the results"
cat .tmp/coverage.xml

EOF


# Test Codestyle
# --------------
cat > run/test-codestyle << EOF
#!/bin/sh

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
python3 -m pip install --upgrade --no-cache-dir pycodestyle

echo "Run tests"
python3 -m flake8 --doctest --output-file=.tmp/flake8.txt src
python3 -m pycodestyle -v src/

echo ""
echo "Show the results"
cat .tmp/flake8.txt

EOF


# Test Documentation
# ------------------
cat > run/test-documentation << EOF
#!/bin/sh

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


# Test Lint
# ---------
cat > run/test-lint << EOF
#!/bin/sh

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

echo "Run verification for most common problems"
python3 -m pylint --exit-zero --msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}" --output=.tmp/pylint.txt --disable=C0114,C0115,C0116,E0401,C0103 src

echo ""
echo "Show the results"
cat .tmp/pylint.txt

EOF


# Test Static
# -----------
cat > run/test-static << EOF
#!/bin/sh

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Set environment variable"
export PYTHONPATH=src

echo "Create output directory"
mkdir -p .tmp

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir pylama[all] setuptools

echo "Run verification for most common problems"
python3 -m pylama src --linters 'eradicate,mccabe,mypy,pycodestyle,pydocstyle,pyflakes,pylint,isort' --ignore C100,D101,D102,D107,C113,C0114,C115,C0116,D105,C0115,D100,D103,D106,D104 --skip .venv --format pylint --report .tmp/pylama.txt || true

echo ""
echo "Show the results"
cat .tmp/pylama.txt

EOF


# Test Formatter
# --------------
cat > run/test-formatter << EOF
#!/bin/sh

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Install dependencies"
python3 -m pip install --upgrade --no-cache-dir ruff

echo "Run verification for most common problems"
python3 -m ruff check --exit-zero --output-format=junit --output-file=.tmp/ruff.xml src/

echo ""
echo "Show the results"
cat .tmp/ruff.xml

EOF


# Test Formatter
# --------------
cat > run/test-typing << EOF
#!/bin/sh

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
python3 -m mypy --ignore-missing-imports --xml-report=.tmp src || true

echo ""
echo "Show the results"
cat .tmp/cobertura.xml
cat .tmp/index.xml

EOF


# Test Mutation
# -------------
cat > run/test-mutation << EOF
echo Not Implemented

EOF


# Test Report
# -----------
cat > run/report << EOF
#!/bin/sh

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Fix path for SonarScanner"
sed -r 's|<source>.+?</source>|<source>/usr/src</source>|' -i .tmp/coverage.xml
sed -r 's|<source>.+?</source>|<source>/usr/src</source>|' -i .tmp/cobertura.xml

echo "Run analysis"
docker run --rm --net=ecosystem -v \$(pwd):/usr/src:ro sonarsource/sonar-scanner-cli

EOF


# Image Compile
# -------------
cat > run/image-compile << EOF
#!/bin/sh

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Install all dependencies inside src folder"
python3 -m pip install --upgrade --no-cache-dir -r requirements.lock --target src

echo "Remove not needed .dist-info files"
rm -fr src/*.dist-info

echo "Compile all .py files into .pyc"
python3 -m compileall -f src

# echo "Remove all .py files (it should work perfectly fine only with .pyc files"
# find src -name '*.py' -not -name '__main__.py' -not -name '__init__.py' -delete  # not working for now

echo "Collect all files (and dependencies) into .pyz file (uncompressed zip archive)"
python3 -m zipapp --python="/usr/bin/env python3" --output=myapp.pyz src

EOF


# Image Build
# -----------
cat > run/image-build << EOF
#!/bin/sh

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Build Docker image based on the current repository state (git commit)"
docker build --pull . -t localhost:5000/myapp:\$(git log -1 --format='%h')

EOF


# Image Push
# ----------
cat > run/image-push << EOF
#!/bin/sh

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Upload Docker image to the binary repisitory (Registry)"
docker push localhost:5000/myapp:\$(git log -1 --format='%h')

EOF


# Image Remove
# ------------
cat > run/image-remove << EOF
#!/bin/sh

echo "Set flag to print trace of commands"
set -x

echo "Set flag to exit immediately if a command exits with a non-zero status"
set -e

echo "Remove temporary build image"
docker rmi localhost:5000/myapp:\$(git log -1 --format='%h')

EOF

#!/bin/bash

# Python project setup
#
# Creates a local Python 3 virtual environment with pyvenv
#
#   $ ./pyproject.sh myproject
#

# Assign your user name to USER, or specify alternate DEV directory for projects
USER="mll"
DEV="/home/$USER/dev"

# Location of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

NAME=$1
PRJDIR="$DEV/$NAME"
LIC=${2:-GPLv3}  # use GPLv3 by default
COMMIT="Project structure (pyproject.sh)"

mkdir -p "$PRJDIR/"
cd "$PRJDIR"

pyvenv venv

touch "README.md"
cp "$DIR/template/$LIC.txt" "$PRJDIR/LICENSE.txt"
mkdir "$NAME/"
touch "$NAME/__init__.py"

mkdir "tests/"
touch "tests/__init__.py"
echo "import $NAME" >> "tests/test_$NAME.py"

mkdir "docs/"

cp "$DIR/template/setup.py" "$PRJDIR"
sed -i 's/NAME/$NAME/g' setup.py
sed -i 's/LIC/$LIC/g' setup.py

git init
cp "$DIR/template/.gitignore" "$PRJDIR"
git add "*"
git commit -m "$COMMIT"

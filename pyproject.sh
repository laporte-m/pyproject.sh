#!/bin/bash

# Python project setup
#
# Creates a local Python 3 virtual environment with pyvenv
#
#   $ ./pyproject.sh myproject
#

# Projects directory
DEV="/home/mll/dev"

# Location of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

NAME=$1
PRJDIR="$DEV/$NAME"
LIC=${2:-GPLv3}  # GPLv3 by default
COMMIT="Project structure (github.com/laporte-m/pyproject.sh)"

mkdir -p "$PRJDIR/"
cd "$PRJDIR"

pyvenv venv

touch "README.md"
cp "$DIR/template/licenses/$LIC.txt" "$PRJDIR/LICENSE.txt"
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

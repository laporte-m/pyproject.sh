#!/bin/bash

# Python project setup

USER="mll"
DEV="/home/$USER/dev"

# location of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

NAME=$1
PRJDIR="$DEV/$NAME"
LIC=${2:-GPLv3}  # use GPLv3 by default
COMMIT="Project setup"

mkdir -p "$PRJDIR/"
cd "$PRJDIR"

# Setup main project package
mkdir "$NAME/"
touch "$NAME/__init__.py"

# Setup tests package
mkdir "tests/"
touch "tests/__init__.py"
echo "import $NAME" >> "tests/test_$NAME.py"

# Create documentation 
mkdir "docs/"
cp "$DIR/template/.gitignore" "$PRJDIR"
cp "$DIR/template/$LIC.txt" "$PRJDIR/LICENSE.txt"
touch "$PRJDIR/README.rst"

# Copy setup.py and replace name and license information
cp "$DIR/template/setup.py" "$PRJDIR"
sed -i 's/NAME/$NAME/g' setup.py
sed -i 's/LIC/$LIC/g' setup.py

# Initialize git repository and commit project structure
git init
git add "*"
git commit -m "$COMMIT"

# Create project virtual environment
pyvenv venv












#!/bin/bash -ev
# Adapted from facebookresearch open source project

# Run this script at project root by "./linter.sh" before you commit.


echo "Running isort..."
isort .

echo "Running yapf..."
black -r -i .

echo "Running flake8..."
flake8 .

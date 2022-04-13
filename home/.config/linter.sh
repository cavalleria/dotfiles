#!/bin/bash -ev
# Adapted from facebookresearch open source project

# Run this script at project root by "./linter.sh" before you commit.

{
  yapf --version | grep -E "0.32.0" > /dev/null
} || {
  echo "Linter requires 'yapf==0.32.0' !"
  exit 1
}

echo "Running isort..."
isort .

echo "Running yapf..."
yapf -r -i .

echo "Running flake8..."
flake8 .

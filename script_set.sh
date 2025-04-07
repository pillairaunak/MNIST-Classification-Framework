#!/bin/bash

# Define source and target paths
SOURCE_PATH="/Users/raunakpillai/work/sjmc/spr2025/pr/git/FS2025_PR_SVM_MLP_CNN"
TARGET_PATH="/Users/raunakpillai/work/sjmc/spr2025/pr/git/MNIST-Classification-Framework"

# Create the directory structure
cd "$TARGET_PATH"

# Create virtual environment
#python -m venv venv
#source venv/bin/activate

# Create directory structure
mkdir -p notebooks
mkdir -p src/svm/model
mkdir -p src/mlp/models
mkdir -p src/cnn/models
mkdir -p results/plots/svm
mkdir -p results/plots/mlp
mkdir -p results/plots/cnn

# Copy files from original project
cp "$SOURCE_PATH/README.md" .
cp "$SOURCE_PATH/utils.py" src/
cp "$SOURCE_PATH/pyproject.toml" .

# Copy notebooks
cp "$SOURCE_PATH/MLP.ipynb" notebooks/
cp "$SOURCE_PATH/cnn.ipynb" notebooks/
cp "$SOURCE_PATH/svm/svm.ipynb" notebooks/

# Copy SVM files
cp "$SOURCE_PATH/svm/svm.py" src/svm/
cp -r "$SOURCE_PATH/svm/model/"* src/svm/model/

# Copy CNN files
cp "$SOURCE_PATH/cnn/logs.txt" src/cnn/
cp -r "$SOURCE_PATH/cnn/models/"* src/cnn/models/

# Copy plot files
cp -r "$SOURCE_PATH/cnn/plots/"* results/plots/cnn/

# Create requirements.txt from the original environment
pip freeze > requirements.txt

# Git operations
git add .
git commit -m "Initialize project with restructured files from original repository"
git push origin main

# Activate the virtual environment whenever you need to work on the project
echo "Project setup complete. To activate the virtual environment in the future, run:"
echo "cd $TARGET_PATH && source venv/bin/activate"

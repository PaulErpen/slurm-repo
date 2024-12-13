#!/bin/bash
set -e
set -x

# set up venv
# Set the target directory for the virtual environment
VENV_DIR="$DATA/venv/geogaussian"

# Create Virtual environment
rm -rf "$VENV_DIR"
python3 -m venv "$VENV_DIR"
echo "Creating virtual environment at $VENV_DIR"

# Activate the virtual environment
source "$VENV_DIR/bin/activate"
echo "Activated virtual environment: $VENV_DIR"

echo "Installing pip dependencies"
# install basics
python3 -m pip install -v torch
python3 -m pip install -v open3d
python3 -m pip install -v plyfile
python3 -m pip install -v torchvision
python3 -m pip install -v tqdm

# Reset repo
cd repos
rm -rf GeoGaussian-capped
git clone https://github.com/PaulErpen/GeoGaussian-capped.git

echo "Installing cuda kernels"
# install cuda kernels
cd GeoGaussian-capped/submodules/diff-gaussian-rasterization
python3 -m pip install --upgrade -v .

cd ../../../GeoGaussian-capped/submodules/simple-knn
python3 -m pip install --upgrade -v .
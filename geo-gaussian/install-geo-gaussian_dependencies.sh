#!/bin/bash
set -e
set -x

# set up venv
# Set the target directory for the virtual environment
VENV_DIR="venv/geogaussian"

# Step 1: Create the virtual environment (if it doesn't already exist)
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment at $VENV_DIR"
    python3 -m venv "$VENV_DIR"
fi

# Step 2: Activate the virtual environment
source "$VENV_DIR/bin/activate"
echo "Activated virtual environment: $VENV_DIR"

# install basics
python3 -m pip install --target="libs/geogaussian" --upgrade -v torch
python3 -m pip install --target="libs/geogaussian" --upgrade -v open3d
python3 -m pip install --target="libs/geogaussian" --upgrade -v plyfile

# Reset repo
cd repos
rm -rf GeoGaussian-capped
git clone https://github.com/PaulErpen/GeoGaussian-capped.git
ls

# install cuda kernels
cd GeoGaussian-capped/submodules/diff-gaussian-rasterization
ls
python3 -m pip install --upgrade -v .
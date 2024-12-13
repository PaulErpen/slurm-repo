#!/bin/bash

# Reset repo
cd repos
rm -rf GeoGaussian-capped
git clone https://github.com/PaulErpen/GeoGaussian-capped.git
ls

# install cuda kernels
cd GeoGaussian-capped/submodules/diff-gaussian-rasterization
ls
python3 -m pip install --target="../../../../libs/geogaussian" --upgrade -v --no-deps .
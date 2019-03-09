#!/usr/bin/env bash
# Created At Tue Feb 05 2019 2:49:24 PM 
# deploy generated pdf and image to site branch
# 
# Copyright 2019 si9ma <hellob374@gmail.com>

set -e # show error

rm build -rf && mkdir build && find . -name "*.tex" -exec cp {} build \; # move all tex file to build dir
cd build && mkdir -p pdf img # create pdf and img directory

for tex in `git diff-tree --no-commit-id --name-only -r HEAD` # ignore common.tex and color.tex
do
    tectonic $tex --print -o pdf # output to pdf directory
done
#!/usr/bin/env bash
# Created At Tue Feb 05 2019 2:49:24 PM 
# deploy generated pdf and image to site branch
# 
# Copyright 2019 si9ma <hellob374@gmail.com>

set -xv # show error

rm -rf build && git clone --depth=50 --branch=gh-pages https://github.com/si9ma/cool-cheatsheet.git build # clone gh-pages to build
find . -name "*.tex" -exec cp {} build \; # move all tex file to build dir
cd build && mkdir -p pdf img && rm -rf .git # create pdf and img directory if not exist

added_or_changed_tex=`git diff-tree --no-commit-id --name-status -r HEAD | grep -P "^(A|M)" | grep -o -P "(?<=src/).*tex"`
deleted_tex=`git diff-tree --no-commit-id --name-status -r HEAD | grep -P "^(D)" | grep -o -P "(?<=src/).*tex"`
common_or_color_changed=`echo "$added_or_changed_tex" | grep -P "(commont.tex|color.tex|logo.tex)"`
[ "$common_or_color_changed" != "" ] && build_list=`ls -p | grep -v / | grep -P -v "(common.tex|color.tex|logo.tex)"` # if common.tex or color.tex changed , rebuild all tex
[ "$common_or_color_changed" = "" ] && build_list=$added_or_changed_tex

# build 
for tex in $build_list
do
    tectonic $tex --print -o pdf # output to pdf directory
done

# remove
for tex in $deleted_tex
do
    rm -rf pdf/${tex%.tex}.pdf # remove deleted file
done

cd .. # back
rm -rf gh-pages && mkdir -p gh-pages && cp -r build/pdf build/img gh-pages # cp build resule to gh-pages


# push to github
cd gh-pages
touch .nojekyll
git init
git add -A
git commit -m 'deploy'
git push -f "https://${GITHUB_TOKEN}@github.com/si9ma/cool-cheatsheet.git" master:gh-pages

cd -
#!/usr/bin/env sh
emacs -Q --script build-site.el

cd ./content
find . -name '*.png' -exec cp {} ../public/{} \;
cd ..

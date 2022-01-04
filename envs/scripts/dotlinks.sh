#!/bin/sh

for file in ${HOME}/envs/dotfiles/dot.*; do
    name=`echo ${file} | sed -e 's/.*dot//g'`
    ln -s ${file} ${HOME}/${name}
done

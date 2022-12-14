#!/bin/bash

DOTPATH=$(cd $(dirname $0); pwd)

for f in .??*
do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done

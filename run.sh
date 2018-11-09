#!/bin/bash
# A few snippets to change directory and run

PROJECT=$(ls Project/*.pro)

# Get the basename (without pro extension)
filename=$(basename -- "$PROJECT")
PROJECT="${filename%.*}"

cd Project/build
./${PROJECT}
cd ..

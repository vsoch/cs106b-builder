#!/bin/bash
# A few snippets to change directory and build
# This is the (working command) used by qtcreator

# The project should be the only file that ends in PRO
cd Project
PROJECT=$(ls *.pro)

mkdir -p build
cd build
qmake ../${PROJECT} -spec linux-g++ CONFIG+=debug CONFIG+=qml_debug
make

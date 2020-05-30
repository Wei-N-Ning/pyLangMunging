#!/usr/bin/env bash

rm -rf build/* && mkdir build/o
cp -r .venv/lib/python3.8/site-packages/gherkin build/o
cp ./da_func_test*.py build/o
find build -name "*.pyc" -delete
( cd build/o && zip -r partition.zip ./* && cp ./partition.zip .. )
rm -rf build/o

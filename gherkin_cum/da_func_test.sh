#!/usr/bin/env bash

thisfile=$(python -c "import os,sys;print(os.path.abspath('${BASH_SOURCE[0]}'))")
thisdir=$(dirname "${thisfile}")
PYTHONPATH="${thisdir}/build/:${thisdir}" python2.7 "${thisdir}/gherkin_cum/da_func_test.py" $@
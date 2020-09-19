#!/usr/bin/env bash

thisfile=$(python -c "import os;print(os.path.realpath('${BASH_SOURCE[0]}'))")
thisdir=$(dirname "${thisfile}")
python3 "${thisdir}/gherkin_cum/app_functest.py" $@

#!/usr/bin/env python3

from functools import partial
import os
import re
import subprocess
import shutil
import shlex


class PyFile(object):
    def __init__(self, filename):
        self.dirp = make_dirs('/var/tmp/format_test/')
        filename_ = os.path.join(self.dirp,
                                 re.sub('\.py$', '.orig.py', filename))
        make_dirs(filename_)
        shutil.copy2(filename, filename_)
        self.filename = filename_
        self.filename_yapf = ''
        self.filename_black = ''

    def format(self, formatter):
        formatter(self)
        return self

    def summary(self):
        return self.filename


def each_pyfile(dirp):
    def is_pyfile(fn):
        return fn.endswith('.py')

    for dirp_, subdirs, filenames in os.walk(dirp):
        for fn in filter(is_pyfile, filenames):
            yield PyFile(os.path.join(dirp_, fn))


def make_dirs(path_):
    dirp = path_ if path_.endswith('/') else os.path.dirname(path_)
    if not os.path.isdir(dirp):
        os.makedirs(dirp)
    return dirp


class RunYAPF(object):
    EXE = '/usr/local/bin/yapf'

    def __init__(self):
        self.dirp = make_dirs('/var/tmp/format_test/')

    def __call__(self, pyfile):
        filename = os.path.join(
            self.dirp, re.sub('\.orig\.py$', '.yapf.py', pyfile.filename))
        make_dirs(filename)
        shutil.copy2(pyfile.filename, filename)
        cmd = '{} --style="pep8" -i {}'.format(self.EXE, filename)
        subprocess.check_call(shlex.split(cmd))
        pyfile.filename_yapf = filename
        return pyfile


class RunBLACK(object):
    EXE = '/usr/local/bin/black'

    def __init__(self):
        self.dirp = make_dirs('/var/tmp/format_test/')

    def __call__(self, pyfile):
        filename = os.path.join(
            self.dirp, re.sub('\.orig\.py$', '.black.py', pyfile.filename))
        make_dirs(filename)
        shutil.copy2(pyfile.filename_yapf, filename)
        cmd = '{} -q {}'.format(self.EXE, filename)
        try:
            subprocess.check_call(shlex.split(cmd))
        except Exception as e:
            print('failed')
        pyfile.filename_black = filename
        return pyfile


if __name__ == '__main__':
    yapf = RunYAPF()
    black = RunBLACK()
    for pyfile in each_pyfile('.'):
        s = pyfile.format(yapf).format(black).summary()
        print(s)

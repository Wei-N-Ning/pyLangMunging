import os
import sys
import multiprocessing
import argparse
import functools
import itertools
import glob
import time
import logging

logger = logging.getLogger('partition prog')
logging.basicConfig()

import da_func_test_lib  # pylint: disable=import-error
import da_func_test_cost  # pylint: disable=import-error

this_file = os.path.abspath(sys.argv[0])
this_dir = os.path.dirname(this_file)
parent_dir = os.path.dirname(this_dir)


def iter_feature_files(dirp, rela_parent):
    for cur, _, fns in os.walk(os.path.join(dirp)):
        for fn in fns:
            if fn.endswith('.feature'):
                f = os.path.join(cur, fn)
                yield f, rela_parent


def each(tu):
    filename, rela_parent = tu
    cases = []
    dis = os.path.join(rela_parent,
                       filename.split('/{}/'.format(rela_parent))[-1])
    scenarios = da_func_test_lib.Handler.read_and_handle(filename,
                                                         display_filename=dis)
    for s in scenarios:
        cases.extend(s.to_cases())
    return cases


def collect_cases(dirp, rela_parent, seq=False):
    orig_it = iter_feature_files(dirp, rela_parent)

    all_cases = set()
    if seq:
        for filename in orig_it:
            cases = each((filename, rela_parent))
            all_cases.update(cases)
    else:
        pool = multiprocessing.Pool(processes=multiprocessing.cpu_count())
        for cases in pool.imap_unordered(each, orig_it):
            all_cases.update(cases)
    return all_cases


def collect_list_items(dirp):
    list_items = set()
    filenames = glob.glob(os.path.join(dirp, 'group_*'))
    for filename in filenames:
        with open(filename, 'r') as fp:
            list_items.update(l.strip() for l in fp)
    if '' in list_items:
        list_items.remove('')
    return len(filenames), list_items


def update_list_items(it, dirp):
    for idx, partition in enumerate(it):
        filename = os.path.join(dirp, 'group_{}'.format(idx))
        assert os.path.exists(filename), 'list file does not exist!'
        with open(filename, 'w') as fp:
            fp.write('\n'.join(partition))


def parse_args(args):
    p = argparse.ArgumentParser()
    p.add_argument('-d', '--directory', default='func-test/src')
    p.add_argument('-g', '--group-directory', default='func-test')
    p.add_argument('-v', '--verbose', action='store_true')
    return p.parse_args(args)


if __name__ == '__main__':
    a = parse_args(sys.argv[1:])

    print('------------ arg ------------')
    print('pwd:', os.getcwd())
    print('python version:', sys.version_info)
    print(a)

    num_partitions, list_items = collect_list_items(
        os.path.realpath(a.group_directory))
    print('list_items:', num_partitions, len(list_items))

    rela_parents = set()
    for l in list_items:
        rela_parents.add(l.split('/')[0])
    assert len(
        rela_parents) == 1, "found more than one relative parent\n\n{}".format(
            rela_parents)
    print('rela_parents', rela_parents)
    rela_parent = list(rela_parents)[0]
    cases = filter(lambda c: c.to_list_item() in list_items,
                   collect_cases(a.directory, rela_parent))

    print('cases:', len(cases))

    assert len(cases) == len(list_items), \
        'number of cases is different to the original list'

    print('partitioning...')
    now = time.time()
    it = da_func_test_cost.partition_cases(cases,
                                           num_partitions=num_partitions)
    update_list_items(it, os.path.realpath(a.group_directory))
    print('DONE', (time.time() - now), 'sec')

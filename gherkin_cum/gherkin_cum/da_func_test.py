import os
import sys
import multiprocessing
import argparse

import da_func_test_lib


def iter_feature_files(dirp):
    for cur, _, fns in os.walk(dirp):
        for fn in fns:
            if fn.endswith('.feature'):
                f = os.path.abspath(os.path.join(cur, fn))
                yield f


def each(filename):
    items = []
    scenarios = da_func_test_lib.Handler.read_and_handle(filename)
    for s in scenarios:
        items.extend(s.to_list_items())
    return items


def main(dirp, seq=False):
    it = iter_feature_files(dirp)
    all_items = set()
    if seq:
        for filename in it:
            items = each(filename)
            all_items.update(items)
    else:
        pool = multiprocessing.Pool(processes=multiprocessing.cpu_count())
        for items in pool.imap_unordered(each, it):
            all_items.update(items)
    for i in sorted(all_items):
        print(os.path.basename(i))


def parse_args(args):
    p = argparse.ArgumentParser()
    p.add_argument('directory', default='.')
    return p.parse_args(args)


if __name__ == '__main__':
    a = parse_args(sys.argv[1:])
    directory = os.path.realpath(a.directory)
    print(directory)
    main(directory)

#!/usr/bin/env python
import argparse, os, sys, re


# sort the symbols in each import statements
def sort_imported_symbols(line):
    o = re.search(r'\((.+,.+)\)', line)
    if o is None:
        return line
    symbols = sorted(s.strip() for s in o.groups()[0].split(','))
    head = line[0:o.start()]
    s = head + '( ' + symbols[0]
    for symbol in symbols[1:]:
        s += '\n' + ' ' * len(head) + ', ' + symbol
    s += '\n' + ' ' * len(head) + ')\n'
    return s


def sort_imports(reader, writer):
    group = []
    open_space = 0
    prev_line = ''
    opener_regex = r'^\s*import\s+'
    dangling_paren_regex = r'^\s*\('
    for line in reader:
        # an "opener" of an import statement, e.g.
        # import ...
        if re.match(opener_regex, line):
            open_space = line.count('(') - line.count(')')
            group.append(line)
        # a "dangling" paren; need to check if the previous line
        # is an opener and concat them
        elif re.match(dangling_paren_regex, line) and re.match(opener_regex, prev_line):
            open_space = line.count('(') - line.count(')')
            group[-1] += line
        # there is at least one open paren, meaning that it is
        # still a part of the import statement; append the line
        # to the last line so that it is sorted as a single str
        elif open_space > 0:
            open_space -= line.count(')') - line.count('(')
            group[-1] += line
        else:
            for import_line in sorted(group):
                writer.write(import_line)
            group = []
            writer.write(line)

        prev_line = line

    for import_line in sorted(group):
        writer.write(import_line)


def sort_all_imports(in_filenames, out_dir):
    for in_filename in in_filenames:
        out_filename = os.path.join(out_dir, in_filename)

        out_dirname = os.path.dirname(out_filename)
        if not os.path.isdir(out_dirname):
            os.makedirs(out_dirname)

        with open(out_filename, 'w') as out_file:
            with open(in_filename) as in_file:
                sort_imports(reader=in_file, writer=out_file)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--out_dir',
                        default='tmp/',
                        help='Root directory to write files with sorted imports')
    parser.add_argument('in_filenames',
                        nargs=argparse.REMAINDER,
                        default=[],
                        help='Paths to the files whose imports we want to sort')
    args = parser.parse_args()

    sort_all_imports(args.in_filenames, args.out_dir)

#!/usr/bin/env python
import argparse, os, sys

# sort the symbols in each import statements
def sort_imported_symbols(line):
    o = re.search(r'\((.+,.+)\)', line)
    if o is None:
        return line
    symbols = sorted(s.strip() for s in o.groups()[0].split(','))
    head = line[0: o.start()]
    s = head + '( ' + symbols[0]
    for symbol in symbols[1:]:
        s += '\n' + ' ' * len(head) + ', ' + symbol
    s += '\n' + ' ' * len(head) + ')\n'
    return s<Paste>

def sort_imports(reader, writer):
    group = []
    open_space = 0
    for line in reader:
        if line.startswith('import '):
            open_space = line.count('(') - line.count(')')
            group.append(line)
        elif open_space > 0:
            open_space -= line.count(')') - line.count('(')
            group[-1] += line
        else:
            for import_line in sorted(group):
                writer.write(import_line)
            group = []
            writer.write(line)

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


parser = argparse.ArgumentParser()
parser.add_argument('--out_dir', default='tmp/', help='Root directory to write files with sorted imports')
parser.add_argument('in_filenames', nargs=argparse.REMAINDER, default=[], help='Paths to the files whose imports we want to sort')
args = parser.parse_args()

sort_all_imports(args.in_filenames, args.out_dir)

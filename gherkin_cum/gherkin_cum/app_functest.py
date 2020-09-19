# click:
# https://codeburst.io/building-beautiful-command-line-interfaces-with-python-26c7e1bb54df

import sys
import multiprocessing

from gherkin.token_scanner import TokenScanner  # pylint: disable=import-error
from gherkin.parser import Parser  # pylint: disable=import-error


class ExceptionWrapper(Exception):
    @classmethod
    def wrap(cls, desc, err):
        ins = cls()
        ins.inner_error = err
        ins.desc = desc
        return ins

    def __str__(self):
        return f'{self.desc}, from: {self.inner_error}'

    def __repr__(self):
        base = super(ExceptionWrapper, self).__repr__()
        return f'{self.desc}, from: {self.inner_error}, {base}'


def parse_one(filename):
    try:
        with open(filename, 'r') as fp:
            text = fp.read()
            try:
                parser = Parser()
                doc = parser.parse(TokenScanner(text))
                return str(type(doc)), None
            except Exception as err:
                return None, ExceptionWrapper.wrap(f'Parse: {filename}', err)
    except Exception as err:
        return None, ExceptionWrapper.wrap(f'Open: {filename}', err)


def iter_filenames(reader):
    for s in reader:
        yield s.strip()


def main():
    it = iter_filenames(sys.stdin)
    # with multiprocessing.Pool() as pool:
    #     for doc, err in pool.map(parse_one, it):
    #         if err is not None:
    #             error(err)
    #         print(doc)
    for fn in it:
        print(parse_one(fn))


if __name__ == "__main__":
    main()

import sys
import re
import os
import collections

from gherkin.token_scanner import TokenScanner
from gherkin.parser import Parser

score_by_keyword = {
    'Given': 1,
    'And': 0,
    'Then': 1,
    'When': 1,
}


class ScenarioOutline:
    def __init__(self):
        self.steps = []  # a list of dict
        self.examples = []  # a list of dict
        self.tags = []  # a list of string
        self.filename = None
        self.lineno = None

    def nsteps(self):
        score = 0
        for keyword, t in self.steps:
            if keyword not in score_by_keyword:
                continue
            elif re.search(r'should \w+', t):  # score
                score += 10
            elif re.search(r'\s+sends\s+', t):  # score
                score += 10
            elif re.search(r'\s+receives\s+', t):  # score
                score += 10
            elif re.search(r'[^\s]+\s+is\s+[^\s]+', t):  # score 0
                continue
            else:
                score += 1
        return score

    def nexamples(self):
        return len(self.examples)

    def to_cases(self):
        c = Case()
        c.cost = self.nsteps()
        c.tags = self.tags
        c.filename = self.filename
        c.lineno = self.lineno
        cs = [c]
        for lineno, _ in self.examples:
            c_ = Case()
            c_.cost = self.nsteps()
            c_.filename = self.filename
            c_.lineno = lineno
            cs.append(c_)
        return cs


class Scenario:
    def __init__(self):
        self.steps = []
        self.tags = []
        self.filename = None
        self.lineno = None

    def nsteps(self):
        score = 0
        for keyword, t in self.steps:
            if keyword not in score_by_keyword:
                continue
            elif re.search(r'should \w+', t):  # score
                score += 10
            elif re.search(r'\s+sends\s+', t):  # score
                score += 10
            elif re.search(r'\s+receives\s+', t):  # score
                score += 10
            elif re.search(r'[^\s]+\s+is\s+[^\s]+', t):  # score 0
                continue
            else:
                score += 1
        return score

    def to_cases(self):
        c = Case()
        c.cost = self.nsteps()
        c.tags = self.tags
        c.filename = self.filename
        c.lineno = self.lineno
        return [c]


class Case:
    def __init__(self):
        self.cost = 0
        self.tags = []
        self.filename = None
        self.lineno = None

    def nsteps(self):
        return self.cost

    def to_list_item(self):
        return '{}:{}'.format(self.filename, self.lineno)


class Handler:
    @staticmethod
    def read_and_handle(filename, display_filename=None):
        parser = Parser()
        h = Handler(
            filename=display_filename if display_filename else filename)
        with open(filename, 'r') as fp:
            h.handle(parser.parse(fp.read()))
        return h.scenarios

    def __init__(self, filename=''):
        self.scenarios = []
        self.filename = filename

    def handle(self, node):
        meth = getattr(self, '_handle_{}'.format(node['type']), None)
        assert meth, node['type']
        meth(node)  # pylint: disable=not-callable

    def _handle_GherkinDocument(self, node):
        feature = node['feature']
        for c in node.get('comments', []):
            self.handle(c)
        if feature:
            self.handle(feature)

    def _handle_Comment(self, node):
        # 'type', 'location', 'text'
        pass

    def _handle_Feature(self, node):
        for child in node.get('children', []):
            self.handle(child)

    def _handle_Background(self, node):
        __ = node['steps']

    def _handle_ScenarioOutline(self, node):
        so = ScenarioOutline()
        so.lineno = node['location']['line']
        so.tags = [t['name'] for t in node['tags']]
        so.steps = [(s['keyword'].strip(), s['text'].strip())
                    for s in node['steps']]
        so.filename = self.filename
        self.scenarios.append(so)
        for example in node.get('examples', []):
            self.handle(example)

    def _handle_Scenario(self, node):
        s = Scenario()
        s.lineno = node['location']['line']
        s.tags = [t['name'] for t in node['tags']]
        s.steps = [(st['keyword'].strip(), st['text'].strip())
                   for st in node['steps']]
        s.filename = self.filename
        self.scenarios.append(s)

    def _handle_Examples(self, node):
        so = self.scenarios[-1]
        header = [hd['value'] for hd in node['tableHeader']['cells']]
        for row in node.get('tableBody', []):
            kv = dict(zip(header, [cell['value'] for cell in row['cells']]))
            so.examples.append((row['location']['line'], kv))


if __name__ == '__main__':
    this_file = os.path.abspath(sys.argv[0])
    this_dir = os.path.dirname(this_file)
    fea_file = os.path.join(this_dir, '..', 'resources',
                            'CEB_Dependencies.feature')
    scenarios = Handler.read_and_handle(fea_file)
    for sc in scenarios:
        for keyword, t in sc.steps:
            if re.search(r'should \w+', t):  # score 10
                continue
            elif re.search(r'\s+sends\s+', t):  # score 10
                continue
            elif re.search(r'\s+receives\s+', t):  # score 10
                continue
            elif re.search(r'[^\s]+\s+is\s+[^\s]+', t):  # score 0
                continue
            print(t)  # score 1
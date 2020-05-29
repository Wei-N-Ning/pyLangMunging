import sys
import os
import collections

from gherkin.token_scanner import TokenScanner
from gherkin.parser import Parser


class ScenarioOutline:
    def __init__(self):
        self.steps = []  # a list of dict
        self.examples = []  # a list of dict
        self.tags = []  # a list of string
        self.filename = None
        self.lineno = None

    def omitted(self):
        return '@ignore' in self.tags

    def nsteps(self):
        return len(self.steps)

    def nexamples(self):
        return len(self.examples)

    def to_list_items(self):
        if self.omitted():
            return []
        l = ['{}:{}'.format(self.filename, self.lineno)]
        for lineno, _ in self.examples:
            l.append('{}:{}'.format(self.filename, lineno))
        return l


class Scenario:
    def __init__(self):
        self.steps = []
        self.tags = []
        self.filename = None
        self.lineno = None

    def omitted(self):
        return '@ignore' in self.tags

    def nsteps(self):
        return len(self.steps)

    def to_list_items(self):
        if self.omitted():
            return []
        return ['{}:{}'.format(self.filename, self.lineno)]


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
        so.steps = [(s['keyword'], s['text']) for s in node['steps']]
        so.filename = self.filename
        self.scenarios.append(so)
        for example in node.get('examples', []):
            self.handle(example)

    def _handle_Scenario(self, node):
        s = Scenario()
        s.lineno = node['location']['line']
        s.tags = [t['name'] for t in node['tags']]
        s.steps = [(s['keyword'], s['text']) for s in node['steps']]
        s.filename = self.filename
        self.scenarios.append(s)

    def _handle_Examples(self, node):
        tags = set(t['name'] for t in node['tags'])

        if '@unimplemented' in tags or '@ignore' in tags:
            return

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
    for s in scenarios:
        for i in s.to_list_items():
            print(i)

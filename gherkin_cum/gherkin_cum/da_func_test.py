import sys
import os
import collections

from gherkin.token_scanner import TokenScanner
from gherkin.parser import Parser


class Scenario:
    def __init__(self):
        self.steps = []
        self.examples = []


class Example:
    def __init__(self):
        self.rows = collections.OrderedDict()

class Handler:

    @staticmethod
    def read_and_handle(filename):
        parser = Parser()
        h = Handler()
        with open(filename, 'r') as fp:
            return h.handle(parser.parse(fp.read()))

    def __init__(self):
        self.scenarios = []

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
        _ = node['tags']
        __ = node['steps']
        for example in node.get('examples', []):
            self.handle(example)

    def _handle_Scenario(self, node):
        _ = node['steps']
        __ = node['steps']

    def _handle_Examples(self, node):
        _ = node['tags']
        __ = node['tableHeader']
        for r in node.get('tableBody', []):
            self.handle(r)

    def _handle_TableRow(self, node):
        for c in node.get('cells', []):
            self.handle(c)

    def _handle_TableCell(self, node):
        _ = node['value']

def prt_members(node):
    print('{}: {}'.format(node['type'], node.keys()))

if __name__ == '__main__':
    this_file = os.path.abspath(sys.argv[0])
    this_dir = os.path.dirname(this_file)
    fea_file = os.path.join(this_dir, '..', 'resources', 'CEB_Dependencies.feature')
    some = Handler.read_and_handle(fea_file)

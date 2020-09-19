# source:
# https://stackoverflow.com/questions/43107367/how-to-use-gherkin-official

# see also:
# https://github.com/cucumber/gherkin-python/tree/master/test
# https://github.com/cucumber-attic/gherkin
from gherkin.token_scanner import TokenScanner
from gherkin.parser import Parser
parser = Parser()
feature_file = parser.parse(
    TokenScanner('''
Feature: Foo
  Background:

  Scenario Outline: 12
  
  Scenario Outline: 15

'''))
print(feature_file)

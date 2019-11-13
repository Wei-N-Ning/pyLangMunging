# Write a PEG parser for fun and profit

source: youtube | Write a PEG parser for fun and profit

## 02:49

can generate most of the parser from the grammar;
from the parser-generator's point of view the resulting parser code is "data";
from the compiler's point of view the resulting parser code is "code";

## 09:43

CST: concrete syntax tree (e.g. produced by PGEN);

## 10:44

PEG: parsing expression grammar

different approach to parsing; use infinite lookahead, potentially
loading all the tokens of the entire program; the remediation is
nowadays memory is cheap

## 12:06 advantages of PEG

can be made to support left recursion in rules;

more power, therefore grammars look more natural;
user-facing language grammar does not have to be a completely different
set of syntax;

use actions (similar to `{...}` in bson); can generate AST directly;
saving memory

## 15:06

`v 1` the hobby PEG project work log:

- is one of a few versions he wrote; blogged about it and the version
  in the blog is the cleaner version;

- got help from python core devs;

- wrote a test program to run the parser in a directory with many files;

- claimed to "parse everything" - as far as he could tell

- but also use focused approach to deal with edge cases in the standard
  library; some lib 2.2.3 test cases now throw syntax errors (not so bad)

**MY NOTES**: interesting to see his approach; I took a similar approach when
working on the bash-py transpiler (particularly the first version)

## 16:33 how does PEG work

### Generator

translate grammar to recursive descent parser;

generate code for every rule in the grammar (rather than a parsing
table); generate a function (or a method) that recognises that part
of the grammar; when a rule references another rule, the function
just calls another function;

has a high hope that the C stack is large enough for a complex program

insert actions (C or Python expressions, depending on the source language
of the parser program) into the generated code;

**MY NOTES**: try `1 ++++ 1` (`+=` is treated as one token but `++`
is treated as two separate `+` token)

## 25:36 Memoization

why is it needed?

in the example, if the input is just "spam", the expr() function does
double work:

- call term(), which succeeds, then expect('+') fails
- reset position, and call term() again

**MY NOTES**: does haskell parser combination have the same double
work issue ?? **FIND IT OUT**.

using a simple memoization, "packrat parsing";
theory says this restores O(N) parsing speed;

can be implemented by `@memoize` decorator;

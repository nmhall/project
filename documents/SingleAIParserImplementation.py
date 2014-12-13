from SingleAIParser import *

class SingleAIGrammarParserImplementation(SingleAIGrammarParser):
    def __init__(self, whitespace=None, nameguard=True, **kwargs):
        super(SingleAIGrammarParserImplementation, self).__init__(
            whitespace=whitespace,
            nameguard=nameguard,
            **kwargs
        )
        
# We don't actually want to override any of the default Exception behavior
class IQException(Exception):
    pass

# Semantics Class enforces the IQ Limitations for each unit type.
# Each time a new rule is added, we raise an error if it exceeds the allowed
# number for the unit.
# Limitations are currently 2, 4, and 6.
class SingleAIGrammarSemantics(object):
    def __init__(self):
        self.maxDumbRules = 2
        self.maxMediumRules = 4
        self.maxSmartRules = 6
        self.dumbRules = 0
        self.mediumRules = 0
        self.smartRules = 0

    def dumbFormation(self, ast):
        self.dumbRules += 1
        if self.dumbRules > self.maxDumbRules:
            raise IQException("Too many rules supplied to short AI")
        return ast
    def dumbMovement(self, ast):
        self.dumbRules += 1
        if self.dumbRules > self.maxDumbRules:
            raise IQException("Too many rules supplied to short AI")
        return ast
    def dumTargeting(self, ast):
        self.dumbRules += 1
        if self.dumbRules > self.maxDumbRules:
            raise IQException("Too many rules supplied to short AI")
        return ast

    def mediumFormation(self, ast):
        self.mediumRules += 1
        if self.mediumRules > self.maxMediumRules:
            raise IQException("Too many rules supplied to int AI")
        return ast
    def mediumMovement(self, ast):
        self.mediumRules += 1
        if self.mediumRules > self.maxMediumRules:
            raise IQException("Too many rules supplied to int AI")
        return ast
    def mediumTargeting(self, ast):
        self.mediumRules += 1
        if self.mediumRules > self.maxMediumRules:
            raise IQException("Too many rules supplied to int AI")
        return ast

    def smartFormation(self, ast):
        self.smartRules += 1
        if self.smartRules > self.maxSmartRules:
            raise IQException("Too many rules supplied to double AI")
        return ast
    def smartMovement(self, ast):
        self.smartRules += 1
        if self.smartRules > self.maxSmartRules:
            raise IQException("Too many rules supplied to double AI")
        return ast
    def smartTargeting(self, ast):
        self.smartRules += 1
        if self.smartRules > self.maxSmartRules:
            raise IQException("Too many rules supplied to double AI")
        return ast

# Main stuff shamelessly copied from the Grako-generated file
# SingleAIParser.py
def main(filename, startrule, trace=False, whitespace=None, nameguard=None):
    import json
    with open(filename) as f:
        text = f.read()
    semantics = SingleAIGrammarSemantics()
    parser = SingleAIGrammarParserImplementation(parseinfo=False)
    ast = parser.parse(
        text,
        startrule,
        filename=filename,
        trace=trace,
        whitespace=whitespace,
        nameguard=nameguard,
        semantics=semantics)
    print('AST:')
    print(ast)
    print()
    print('JSON:')
    print(json.dumps(ast, indent=2))
    print()

if __name__ == '__main__':
    import argparse
    import string
    import sys

    class ListRules(argparse.Action):
        def __call__(self, parser, namespace, values, option_string):
            print('Rules:')
            for r in SingleAIGrammarParser.rule_list():
                print(r)
            print()
            sys.exit(0)

    parser = argparse.ArgumentParser(description="Simple parser for SingleAIGrammar.")
    parser.add_argument('-l', '--list', action=ListRules, nargs=0,
                        help="list all rules and exit")
    parser.add_argument('-n', '--no-nameguard', action='store_true',
                        dest='no_nameguard',
                        help="disable the 'nameguard' feature")
    parser.add_argument('-t', '--trace', action='store_true',
                        help="output trace information")
    parser.add_argument('-w', '--whitespace', type=str, default=string.whitespace,
                        help="whitespace specification")
    parser.add_argument('file', metavar="FILE", help="the input file to parse")
    parser.add_argument('startrule', metavar="STARTRULE",
                        help="the start rule for parsing")
    args = parser.parse_args()

    main(
        args.file,
        args.startrule,
        trace=args.trace,
        whitespace=args.whitespace,
        nameguard=not args.no_nameguard
    )


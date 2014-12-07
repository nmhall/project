from SingleAIParser import SingleAIGrammarParser

class SingleAIGrammarParserImplementation(SingleAIGrammarParser):
    def __init__(self, whitespace=None, nameGuard=True, **kwargs):
        super(SingleAIGrammarParserImplementation, self).__init__(
            whitespace=whitespace,
            nameguard=nameguard,
            **kwargs
        )

class IQException(Exception):
    pass

class SingleAIGrammarSemantics(object):
    maxDumbRules = 2
    maxMediumRules = 4
    maxSmartRules = 6

    def __init__(self):
        self.dumbRules = 0
        self.mediumRules = 0
        self.smartRules = 0

    def dumbFormation(self, ast):
        self.dumbRules += 1
        if self.dumbRules > maxDumbRules:
            raise IQException("Too many rules supplied to short AI")
        return ast
    def dumbMovement(self, ast):
        self.dumbRuleS += 1
        if self.dumbRules > maxDumbRules:
            raise IQException("Too many rules supplied to short AI")
        return ast
    def dumTargeting(self, ast):
        self.dumbRules += 1
        if self.dumbRules > maxDumbRules:
            raise IQException("Too many rules supplied to short AI")
        return ast

    def mediumFormation(self, ast):
        self.mediumRules += 1
        if self.mediumRules > maxMediumRules:
            raise IQException("Too many rules supplied to int AI")
        return ast
    def mediumMovement(self, ast):
        self.mediumRules += 1
        if self.mediumRules > maxMediumRules:
            raise IQException("Too many rules supplied to int AI")
        return ast
    def mediumTargeting(self, ast):
        self.mediumRules += 1
        if self.mediumRules > maxMediumRules:
            raise IQException("Too many rules supplied to int AI")
        return ast

    def smartFormation(self, ast):
        self.smartules += 1
        if self.smartules > maxSmartRules:
            raise IQException("Too many rules supplied to double AI")
        return ast
    def smartMovement(self, ast):
        self.smartules += 1
        if self.smartules > maxSmartRules:
            raise IQException("Too many rules supplied to double AI")
        return ast
    def smartTargeting(self, ast):
        self.smartules += 1
        if self.smartules > maxSmartRules:
            raise IQException("Too many rules supplied to double AI")
        return ast

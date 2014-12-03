from SingleAIParser import SingleAIGrammarParser

class SingleAIGrammarParserImplementation(SingleAIGrammarParser):
    def __init__(self, whitespace=None, nameGuard=True, **kwargs):
        super(SingleAIGrammarParserImplementation, self).__init__(
            whitespace=whitespace,
            nameguard=nameguard,
            **kwargs
        )

# Nov. 2nd Critique
## Ari

### Code?
Any chance you'll push the spring-side code Alex has been working on to the repo? It would be cool to see what's going on there, as the entire semantic side of your language is a black box without it.

Also, in terms of organization, you probably should have the code in a "src" folder, not your "documents" folder.

### Preliminary Evaluation
It sounds like you guys are in a good place. From what I can see, you guys have a solid parser down (yay Grako! (also it's spelled with a 'k' not a 'c')). In terms of not wanting to go through JSON - Grako provides a way you can apply your own semantics to the parsed AST, I recommend checking it out. Even if it doesn't completely relieve you of JSON, it may help simplify the tree down to the essentials you really care about. 

I look forward to seeing this game. It may also help users if you create a quick cheat sheet, how-to guide, or tutorial. Even just updating your brief language overview to reflect how one actually writes in the language (now that your syntax is mostly finalized) could be helpful.
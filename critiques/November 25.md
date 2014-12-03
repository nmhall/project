# Nov. 25th Critique
## Ari

### Language Overview
Why call them "Short", "Int", and "Double"? Is there some sort of significance to these names? Is the theme of your game a bunch of numbers inside a computer fighting? If not, this should change. Also, as a CS person, I am deeply disturbed by these not being 2/4/8 IQ with those names. I'm also disturbed that "Double" is not twice as smart as "Int".

You mention that "The first rule in each category must be default, and the rest must be conditionals", but in your grammar it looks like the default is the last rule, not the first.

### Samples
No ending newline in EmptyAI.txt. CS70grad is sad.

In your sample AI, it looks like your "Short" has an IQ of 4: it has a default formation, a conditional and a default movement, and a default targeting defined. Am I missing something about your IQ counting?

### Parsing
The grako stuff looks nice. Have you thought about how you will add any additional errors? For example, it would be really great for users if you could catch them using the same condition twice - like "health < 5 and health < 3." At the very least you need some way of enforcing the intelligence, where will that happen?

How does this get to spring? Does spring just take the json directly? If not, where is your semantics code, will that be coming soon?
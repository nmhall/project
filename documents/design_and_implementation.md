# Language design and implementation overview

## Language design

### What does a program in our language look like?

Our language in its current phase of design is pretty much as planned. An external DSL processed from
a text file in Java, the language provides sets of conditionals for the three main categories of AI
behavior, which we have decided should be grouping, movement, and targeting. In each case, the user
writes something very similar to a switch statement, with a set of conditionals each of which selects
from the allowed behaviors for each category. By keeping the set of possibilities small but carefully
choosing which actions and conditionals are allowed, we hope to keep our job manageable while still
allowing room for real creativity.

### What does a program in our language do?

The end result of our language should be a functional AI file for a Spring game of our creation.
The basic unit of computation is to add a conditional determining the behavior of an AI unit under
circumstances where the condition is matched. The basic data structures within the language are the
three behaviors, and the basic data structure that we compile to is an AI for the game.
The only control structure in our language is the basic list of conditionals.

### How is a program in our language processed?

A program is a text file written by the user and provided to our "compiler", written in Java, as input.
We parse the input and create an intermediate representation object that represents the list of
conditionals written by the user. At this point, we enforce the IQ restrictions for each unit and throw 
an error if they have provided too many instructions. Thoughts on this IR object are in a separate file
in our documents folder. The object is then written to a text file as JSON, and provided to an AI class
in the Spring framework. That class will be able to interpret the IR as instructions for each unit, and
cause them to behave accordingly. A user can then create AIs, load them into Spring, and have them
fight.

### What can go wrong in our language?

Aside from syntax errors, which should be handled by the parser, the main thing that can go wrong with
a program is going over the IQ limitation. So long as our code is implemented correctly, the user will
not be able to write legal syntax that causes Spring or the AI class to fail in any way, other than
to act poorly which is obviously not an error. If the IQ limitation is broken, we can simply throw
and exception on the spot. Our Spring AI will have (bad) defaults built in so that it always runs,
even if the user supplies an illegal AI instruction set.

Right now, we don't have any plans to help the user out any more than alerting them to errors and
their sources as best we know. They write in a text file, which is probably not ideal in the long
run but should be fine for our purposes within the scope of this class.

### Are there any other languages that do this?

As far as we can tell, there are not any other languages for this purpose. You could argue that the
Spring AI class structure itself is in some ways a DSL for AI creation, but ours is much more specific
both in that it works only for the one game of our creation, and that it imposes strict restrictions
on the legal things that a user can say.

## Language implementation

As previously mentioned, our language is external. Given the rather game-specific nature of the things
we want a user to be able to say, giving them a non-programming-language-looking syntax made a lot of
sense, and programs have a nice ordered structure that makes parsing hopefully simple.

Our host language is Java. Having a strong sense of classes made a lot of sense for the kinds of
behaviors we want, and there is a good Spring AI API in Java.

Our syntax design decision are already documented in a separate file, and we've gotten some good
feedback on them. The big picture is that we want to keep the language restrictive enough that users
are not overwhelmed with possible instructions and it isn't too easy to make your AI behave exactly
how you want without exceeding your IQ quota, but keep the syntax expressive enough to allow for
cleverness, creativity, and originality.

Our system starts with a user-written text file detailing the conditional behavior of each unit in
the game, subject to IQ limitations. This is parsed in Java and the AST is scanned to enforce IQ
rules. If all units are legally defined, then an IR object is made for each of them. These are
written as JSON to a text file, which is read in by a Spring AI class. This class uses that object
to determine the behavior of each unit on the map every cycle of the game. The game will have a
simple map and the same starting set of units for each player, and will pit two AIs against each
other.

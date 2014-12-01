# Preliminary evaluation

## What works well, and what could be improved?

Right now, we think that the basics of our game and grammar are in a reasonably good spot. The game especially
will be very easy to modify in order to support the things we need from it, and we have an AI class with basic 
functionality that should be easily extensible to the behaviors we want.
The grammar currently supports a lot of the behavior
that we think is important to making an interesting game with actual choices, and we have a grammar file which
generates parsers using Grako.

With regard to things that need to be improved, we received some good feedback on the grammar from user testing
and we will be implementing those shortly. Most important is probably removing the requirement for a default,
which turned out to not make a ton of sense. Additionally, we need to add post-parsing checks on the AST to enforce
the rules on number of commands to each type of unit.Obviously, the way users create AIs could be improved over
simply typing into a .txt file, but that would probably take a lot of tangential effort to make a nice user
interface. We're also not huge fans of having to go through JSON, so the implementation could probably be simplified
in some way to avoid that, but such is life.

## Evaluation and changes

The majority of our changes have come from critique feedback and the user testing. Many of our explicit goals were
related to what users could do in the game, which we hope we have accomplished but have yet to really see in action.

## Difficulties

Probably the main difficulties were deciphering the workings of the Spring engine, and getting a parser which
generated nice things. We originally wanted to parse using ANTLR, but couldn't find enough documentation.
Grako is nice, but we have to go through JSON to get from the Python AST to Java for Spring AI. Additionally, the
Spring framework is pretty complicated, so creating a game with units that can actually do things was harder than
it needed to be.

## Work remaining

To make this a shippable product, many things would need to happen. However, most of those things have very little
to do with DSLs, so we are focusing on what is needed to have a reasonably strong language and a working game demo.
This means integrating the feedback from user testing to improve the syntax, and then implementing a couple AIs that
represent legal AI descriptions in our language. Even if we don't get the JSON translation finished, we will be able
to show in a demo working AIs that represent legal descriptions in our language, and show the different choices that
can be made in creating an AI.

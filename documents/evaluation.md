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
the rules on number of commands to each type of unit. Obviously, the way users create AIs could be improved over
simply typing into a .txt file, but that would probably take a lot of tangential effort to make a nice user
interface, which isn't particularly relevant to the class (or particularly interesting). We're also not huge fans 
of having to go through JSON, which is only necessary because we weren't able to find a java parser that better 
suited our needs. 

## Evaluation and changes

The majority of our changes have come from critique feedback and the user testing. Ari in particular gave us
a lot of very good feedback on how to simplify/redisign our syntax to make it more expressive and
user friendly. Unfortunately its hard to get users in front of a working game because its windows only, 
so we havent been able to get any feedback on how units "feel". That said, we're trying very hard not to 
put a ton of effort into unit design/game balance so that may actually be a good thing.

Many of our explicit goals were related to what users could do in the game, so it's hard for us to assess how
well we did on that front. Hopefully we'll be far enough along in the next few weeks that we'll be able 
to assess how we did with regard to these goals. 

## Difficulties

Probably the main difficulties were deciphering the workings of the Spring engine, and getting a parser which
generated nice things. Spring has been great - it deals with a TON (A TON!!) of the game engine related things
so we don't have to do them, which is amazing. However, Spring has almost no documentation, so we were forced
to spend a lot of time looking through the raw source code as well as other game implementations to figure
out how to create the game features we wanted. 

With regard to parsing - we originally wanted to parse using ANTLR, but couldn't find enough documentation. It seems 
the author of ANTLER wants to force people to buy his book on the language before letting them use it.
We eventually settled for the python parser Graco, which made the actual impelmentation much easier.
However, since the AI is written in Java, we have to go through JSON to get from the Python AST 
to the Spring AI. In an ideal world we would have been able to consolodate the AI code and parsing code
but unfortunately that wasn't an option. If the AI had tried to do the parsing and unit control at the 
same time it may have slowed down the game, so while using Graco will probably lead to a better game it's
unfortunate that it requires us to do a lot more coding. 

## Work remaining

To make this a shippable product, many things would need to happen. However, most of those things have very little
to do with DSLs, so we are focusing on what is needed to have a reasonably strong language and a working game demo.
This means integrating the feedback from user testing to improve the syntax, and then implementing a couple AIs that
represent legal AI descriptions in our language. Even if we don't get the JSON translation finished, we will be able
to show in a demo working AIs that represent legal descriptions in our language, and show the different choices that
can be made in creating an AI.

Alex has worked on the Spring game while Nathan has worked on the parser. We collaborated on language
design and expect to collaborate on the remaining AI design. 


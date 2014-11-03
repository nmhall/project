# Project plan

## Language evaluation
Our language will have accomplished its goals if we can use it to write
functional AIs for our game. Our goals for the language design are:
  + We can write multiple non-trivial AIs with fundamentally different strategies.
  + IQ is the limiting resource (i.e. a unit with 10 IQ should be easy to make
    considerably stronger than a unit with 5 IQ).
  + Classes of units serve different purposes and are all valuable
  + Any trivial implementation loses to a well-designed non-trivial one (this is
    a bit vague on the definition of well-designed, but the idea is that the
    game needs to reward cleverness).
  + Being efficient with commands for low-IQ units and being clever with commands
    for high-IQ units should both significantly improve the AI.

For implementation, we will have unit tests ensuring syntax correctness for the
language, as well as manually verifying that units behave as instructed.

## Implementation plan
It's difficult to predict how long the game-construction part of the project
will take, and we are aware that we should focus on the actual DSL for this reason.
We plan to make this as an external DSL, and anticipate a large majority of the work
going into designing the syntax.
Our planned schedule will be:
  ++ 11/10: Fully specified language syntax
  ++ 11/17: Proof of concept for game engine
  ++ 11/24: Parser for AI syntax, hope for basic programs running
  ++ 12/01: Be able to actually run a game
  ++ 12/08: Finished product

## Teamwork plan 
For the majority of the work, especially the design, we plan to work together.
Alex will primarily focus on the game engine, and Nathan will focus on the DSL
syntax and parsing. We will meet multiple times a week to ensure that both partners
are contributing significantly to all aspects of the project.

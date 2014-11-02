# Project description and plan

## Motivation

This project is interesting because it's a novel way to add
a mechanic to a game, which should be fun to play! The
problem we're interested in solving here is how to "play" a
real time strategy game. We think that one interesting
approach would be to encode behaviors for units and then let
battles play out from there. Given this approach to the game,
a domain specific language seems like an appropriate solution.
In general we want to encode behaviors using a
programming language, but obviously the existing
languages aren't particularly well suited for this purpose.

It's worth noting that there are existing games that feel
similar to ours, by which I mean they use code to control
units in games. However, our game has a significantly
different aim. Most of the existing games we found are designed
to try to teach people how to code in actual programming
languages. This means that they typically use actual languages
(javascript is common) for input. We're designing a game for
computer science people to play, not a game that is designed
to teach people to code. This means that using a DSL without
any other practical application makes a lot of sense for us,
since it will allow us to finely control every aspect of the
input, and enforce the main features of the game (for example
unit IQ).

## Language domain

Our language has a very specific domain, which is controlling
units in our game. This domain us useful for having fun!
(hopefully). The people who will benefit from our language are
people who enjoy computer science puzzles and RTS games (which
is definitely an overlapping segment).

I think we talked a little bit about the other DSLs in this
domain already. We found some things that were similar to what
we want to do that helped us figure out exactly what's unique
about our language.

## Language design

I think one way to describe the design of the DSL
in one sentence would be as a logic engine for unit
decisions in a RTS game. When a program runs the game engine
takes the decision tree described by that program and
plays out those decisions in real time. The "input" is
the program that the user wrote, more specifically the
list of conditionals that the user provided, as well
as the game state provided by the game engine. The output
is a decision about where to move the unit.

As we've mentioned before, the main control flow that we're
envisioning is essentially a glorified switch case, where
units go through their predefined options and make a decision
based on the state of the game.

The main things that could go wrong are syntax errors. We want
every valid program to be runnable (so no runtime errors),
although we hope that the outcome will not be completely
forseeable by the user at compile time. We might force
users to number their lines to keep the concept of IQ
transparent. Other than that, most of the errors will be
syntactic, so if we have good compile time error detection
it should be easy to diagnose issues with programs.

## Example computations

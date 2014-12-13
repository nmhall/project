# How do I define an AI? #
First, there are 3 different types of unit in the game: **short**, which has an IQ of 2,
**int**, which has an IQ of 4, and **double**, which has an IQ of six. IQ determines how
many instructions you are allowed to give that unit! If you try to use more than the
allowed number, you'll get an error. Now, let's take a look at how you give an instruction
to a unit.

## Categories ##
There are three categories of instructions you can give a unit, which we call **formation**,
**movement**, and **targeting**. An instruction looks like a **condition** and then a
**behavior**. You can use the same conditions for every category, and the behaviors will
be specific to the category. The idea is that whenever the game meets your condition,
that unit will behave in your specified way. If none of your conditions match for a certain
behavior (which will definitely happen for the short unit where you only get 2!), we will 
provide a behavior. But be warned, it will be pretty bad, so you should try to have
something for every category. To help with this, every category can have one *default*
condition, which will kick in if nothing else for that category matches.

## Conditions ##
Now that you have a sense of what rules look like, you need to know what conditions you can
use. You always start with 'if', followed by one or more things from the following list:
  * 'there are <number> enemies <proximity>'
  * 'there are <number> allies <proximity>'
  * 'my health <comparison> <number>'
  * 'a nearby enemy has IQ <comparison> <number>'
  * 'a nearby enemy has health <comparison> <number>'
  * 'a nearby enemy has range <comparison> <number>'

Proximity is either 'adjacent', 'close', or 'around'. Adjacent refers to enemies or allies
that are very near, while close refers to other units in a larger radius and around will
include an even bigger area.

A comparison is either '<' or '>', and they mean exactly what you think.

Use 0 or any positive integer for numbers.

You can combine more than one condition with 'and', so that an example condition might look like
this:

if there are 3 enemies adjacent and a nearby enemy has health < 50

## Behaviors ##
Once you have a condition, you need to tell your unit what to do if that condition is met.
You do this by putting a colon after your condition, then picking from a fixed set of
possibilities. Here are the possibilities for behaviors for each category:

### Formation ###
The possible choices for formation are:
  * 'tight formation'
  * 'loose formation'
  * 'isolation'

These will determine how your unit moves in reaction to the allies around it. As you might
expect, a unit in tight formation will try to stay bunched up with its allies, while a unit
in loose formation will be okay with being a little farther away and a unit in isolation
will actively avoid its allies.

### Movement ###
The possible choices for movement are:
  * 'move toward'
  * 'move away'
  * 'hold ground'

These will determine how your unit moves in reaction to the nearby enemies. A unit given
the behavior of 'move toward' will (no surprises here) move toward enemies to attack while
a unit given 'move away' will fall back from enemies and a unit give 'hold ground' will
pretty much stay where it is. Notice that these can have subtle interactions with
formations, so make sure you're careful to not get your units stuck in bad spots!

### Targeting ###
The possible choices for targeting are:
  * 'target closest'
  * 'target farthest'
  * 'target lowest health'
  * 'target smartest'
  * 'target highest range'

These will determine which of the in-range enemies your unit decides to shoot at when it
attacks. These are pretty self-explanatory: a unit targeting closest will shoot the nearest
enemy unit while one targeting smartest will shoot the enemy with the highest IQ and one
targeting highest range will shoot the enemy with the longest attack range.

## Examples ##
That's it! Now you know how to write AIs using our language. Here are some example rules:

if my health < 50: move away

if there are 3 enemies adjacent: target closest

if a nearby enemy has IQ > 5: target smartest

if there are 4 allies nearby: tight formation

You separate multiple rules in a single category by line breaks. For a full-blown example,
check out SampleAI.txt.
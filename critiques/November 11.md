# Nov. 11th Critique
## Ari

### Thoughts on the grammar

EBNF snobbery: use " ;" after each rule.

  * Grouping formation, targeting, and movement separately means composition can't occur; I'd need to write "if [condition]: tight formation" and "if [same condition]: move toward"  
  * No "or" in extra conditions? It'd be nice to be able to do those.
  * "move toward" and "move away" are ambiguous. Towards or away from what? The nearest enemy? Farthest? Allies?
  * I don't like that you force > or < for certain conditions. As a player/programmer, it seems like it shouldn't be too much harder to also let me run away if my own health is low.
  * What's the difference between "adjacent" and "around"? Is "around" anywhere? Perhaps "total" or "on the battlefield" would be better. Also, keep in mind singular versus plural, if that's something you want to make nicer for the user. One way to do this is to accept either "ally" or "allies", and if they want to not make grammatical sense that's up to them.
  * There's a lot of disjointedness in your language. Some things I spot:
    * You can only conditional based on "a nearby enemy", but you can target farthest (also, sad you only get nearest or farthest, but I get that).
    * From a realism perspective, how do you know an enemy's intelligence on the battlefield?
    * I'm not sure I get formations. What happens if I have two units in tight formation, but one is planning to move towards, and one move away? Or if each unit represents multiple people, what do formations do? Perhaps giving more clear names like "offensive formation" "defensive formation" etc. would help in this case.

In short, it seems like a lot of your grammar is very restrictive. It looks very organized and should be very clean to parse, which from a scoping perspective is great. From a design/player perspective, it looks like your grammar could be a bit more modular. In other words, you could pull out unit descriptors like "smartest", "farthest", etc. and then have something like
```
  movement := ("move", direction, unit_description) | “hold ground” ;
  target := "target", unit_description ;
  direction := "away", "toward" ;
  unit_description := ability_qualifier | unit_type ;
  unit_type := "ally" | "enemy" ;
  ability_qualifier := relative, ability ;
  ability := "health" | "distance" | "intelligence" | "range"
  relative := "highest" | "lowest" ;
```
By breaking down this far, you get much easier potential future extension. Relations could be extended to include middle, or perhaps 2nd highest, etc. New unit abilities like "power" would be trivial to add to the parser too. I'm a huge fan of modularity, and breaking down your language as far as possible, re-using applicable ideas where possible (notice that this was trivial to tack on to both the movement and targeting clause, and thus resolves the movement ambiguity I discussed earlier).

Nice work having such a well-specified grammar!

## Tyler

### Thoughts on the grammar (that Ari didn't already cover)

First, I like Ari's simplification of the grammar, and I agree that it looks much more extensible than your current grammar. One other thing I note is that your grammar includes forced newlines, but no forced indentation. I think the idea behind forced newlines is that you want to make user code human-readable, i.e.:
```
    Formation {
        default:
            Do Something
    }
```
but unfortunately, if you force newlines without forcing indentation, this means users could just get annoyed at the newlines and end up with
```
        Formation {
        default:
     Do Something }
```
which I believe is (roughly) still valid in your syntax. This is an issue my partner and I thought about a lot during Piconot, and we ended up deciding that if we were going to force newlines, we also had to force indentation (a la Python), which is kinda a pain. I think that it is better to just consider newlines as a form of whitespace that gets skipped over, so that a user can write simple programs such as
```
Formation {default: Do Nothing}
```
without having to worry about making many lines of code.

### Thoughts on things missing from the grammar

I'm just going to throw things in here that your current grammar doesn't allow for. I don't know how many of them you actually want to implement in your game:
  * Movement speed -- Maybe you want to bait so you move away slowly
  * Kiting -- This is common in many games. (I know you know how it works, but I'm specifying it here for those that might not) The idea is you want to attack while your attack is available, and then move while your attack is "on cooldown" and then repeat.
    * Maybe you want a movement condition that is like "if: no attack" to allow for this
  * You have "enemyProximity" for a group of enemies, and "enemyHealth" for a specific energy, but what if you want to run away if the *average health* of a group of enemies is past a certain level?

### Thoughts on units

I don't think rock-paper-scissors is necessarily the best setup for your game. In fact, I think weak-medium-strong is better, because then you can set it up such that some number of well-programmed weak units might be able to beat a badly-programmed strong unit. 

If you do rock-paper-scissors, then assuming both players are at a similar level of AI design, then most games will just come down to who has the "build-order" advantage. However, if you enforce that both players have the same units (maybe 1 strong, 5 medium, 10 weak, or something like that), then every game will actually come down to who has the better AI (or maybe some amount of RNG - depending on how your game works).
 


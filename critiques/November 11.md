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
  movement := ("move", direction, unit_description) | “hold ground” ;
  target := "target", unit_description ;
  direction := "away", "toward" ;
  unit_description := ability_qualifier | unit_type ;
  unit_type := "ally" | "enemy" ;
  ability_qualifier := relative, ability ;
  ability := "health" | "distance" | "intelligence" | "range"
  relative := "highest" | "lowest" ;
By breaking down this far, you get much easier potential future extension. Relations could be extended to include middle, or perhaps 2nd highest, etc. New unit abilities like "power" would be trivial to add to the parser too. I'm a huge fan of modularity, and breaking down your language as far as possible, re-using applicable ideas where possible (notice that this was trivial to tack on to both the movement and targeting clause, and thus resolves the movement ambiguity I discussed earlier).

Nice work having such a well-specified grammar!

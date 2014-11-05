# Nov. 4th Critique
## Ari (critiquing Nathan)
### What are one or more things that you like about this project? What's exciting?
I think you guys have a great idea. What I think is really cool is that you've also managed to differentiate it from some of the existing projects out there. As you mention, you intend to use a novel syntax, since your goal is not to teach people to program. I think a good way to capitalize on this would be to aim for syntax that facilitates writing AI; since the goal of the syntax is to describe AI, it should hopefully be good at it, perhaps going beyond the trivial.
I also really like the IQ idea. Limitations breed creativity, so this should be a good way to really constrain the players. It could also in the long term be used to facilitate difficulties/rankings, that is you could have the 5 IQ tier, 10 IQ tier, etc, where presumably higher IQ would lead to better AI design skills standing out more.

### What's the balance of language design vs sheer programming / engineering in this project?
As you've described it, this project is very heavy on the engineering side. Building a game engine is no small task, and getting efficient implementations could be difficult (i.e. how do you get things to scale so that a board with 100 or 1000 units doesn't take forever per timestep; how does finding the nearest enemy work? does it require scanning the whole grid or is there something more efficient?). I am curious to hear more about how you intend to meet your language goals. To copy your goals from the plan:
  + We can write multiple non-trivial AIs with fundamentally different strategies.
  + IQ is the limiting resource (i.e. a unit with 10 IQ should be easy to make
    considerably stronger than a unit with 5 IQ).
  + Classes of units serve different purposes and are all valuable
  + Any trivial implementation loses to a well-designed non-trivial one (this is
    a bit vague on the definition of well-designed, but the idea is that the
    game needs to reward cleverness).
  + Being efficient with commands for low-IQ units and being clever with commands
    for high-IQ units should both significantly improve the AI.

Most of these seem to center around the functionality of your language; what a program is capable of. What goals do you have in terms of how people might use your language? Here's some thoughts:
  + Trivial AIs are trivially implementable (i.e. an AI that just shoots at things in range should be trivial to code)
  + Users can tell why a high IQ unit is better than a low IQ one (i.e. the code is descriptive enough that they can look at two similar units and say, 'aha! This does everything that one does PLUS ___')

### How can the project maximize the time spent on language design? How to focus on interesting, possibly new ideas?
You mentioned there are some existing games that are similar but use real programming languages for their code. Would it be possible to use one of these as your host language? That is, it would be cool to translate from your language, enforcing whatever extra rules you want to, into one of these existing game scenarios, so that you don't have to build the game engine at all (with the idea being that in the future after this course you could replace this with your real engine if you continued work on this). 

You could also keep your game engine to a minimum - don't worry about efficiency, just the bare minimum logic and graphics to make your game run. Don't worry if you have 1 fps or less, just roll with it.

### What are some interesting language design questions that the work will have to answer? In other words, what are the design challenges? Which design problems' solutions are you looking forward to hearing about at the end of the project?
I think your biggest design challenge is restricting without restricting. That is, one of the cool things about the other games in this genre (code controlled) is that using a general purpose language allows you to design almost literally any AI you want. Here, users will only have access to the specific methods describable in the syntax you give them. 

From a game design perspective, I'm also curious how you will do classes, and how that will affect your language. One potentially interesting direction is to add personality the DSL by giving each unit type some special commands that only it has access to, the syntax for which reflects that unit's "personality".

What I'm most interested in though is how you will make the syntax stand out. You've chosen to break from a general purpose programming language, so I expect this to feel different when I'm writing in it. I want to have a "that code does all that?!?" moment where I can easily describe a non-trivial AI.

### What are the primitives in this language?
Looking at your early syntax thoughts, your primitives are units, relations (such as distance), and actions ("attack", "move", "stand still"). 

### Do you know of any libraries, languages, or projects that might help this project?
As I mentioned above, I think it would be worthwile to see if any of the existing games are simple enough (/have CYO scenario builders) that they could serve as a host for your project.

It may take a lot of effort to understand, but the Robot Scripting Language (RSL) and game engine for [Robot Battle](http://www.robotbattle.com) are [open source](http://dev.robotbattle.com/setup_n.html), perhaps you could modify their game engine and/or use RSL as a host language. But again, that may end up being more complex than starting from scratch. But there are also better written/maintained/documented game engines out there, I think you should spend some time researching them and finding one that would be easily adaptable to your game.

### Other thoughts
One idea that I had for IQ that could also be interesting is to make different functions that have different "costs" - i.e. maybe "is there an enemy in front of me" costs 1 IQ, and "turn until facing an enemy" costs 3 IQ.

Check your spelling. "This domain us useful for having fun!"

I'm a little concerned about your division of labor plan - while DSL vs Engine seems like a reasonable dividing line, this is a DSLs class, so it feels like you should each be taking a fair share of that responsibility. Perhaps there is another way to divide the work. Maybe one person focuses on Syntax -> IR, and the other on IR -> Semantics, then you both work on the game engine that these semantics hook into together.

In terms of your Language_Syntax_Thoughts - (a) put a file extension on this. Probably .txt. (b) Move it to your documents. (c) Why do different commands get different conditionals that are allowed? Maybe I want formation based on enemy health (if enemies are weak, we can spread out and attack them 1v1 instead of in a formation), or target selection based on ally proximity (I'm an ranged unit, so if there's a melee class ally close to me, he'll probably be handling the closest enemy and I can fire at the second closest one instead), etc. Restricting these seems like you're already cutting out potential creativity.


## Tyler (critiquing Alex)
### What are one or more things that you like about this project? What's exciting?
I really like the idea of making a game that is based on IQ. There is an Android game that one of my past roommates (Luke St. Marie) used to play a lot that was similar to your idea, but it was a dungeon crawler instead of an RTS game. It was similar in that you didn't actually play the game, instead you made a simple AI to get through each level. It was also similar in that as you levelled up, you unlocked more slots for more advanced conditionals, or more advanced commands to put in each slot (i.e. "attack if my health is higher" instead of just "attack"). I'll ask him what it was, and let you know so you can try it out (pester me if I haven't done this soon).

I'm excited to try playing your game! Hopefully it's fun.

### What's the balance of language design vs sheer programming / engineering in this project?
I think this is a place where you guys should be careful. It would be really easy to get caught up in taking a long time to build a functioning game engine. I think you guys should actually not worry too much about the game engine side of things. Spring is cool, but it could be very time consuming to build a game engine to the point where you're spending as much time on that as you are on the language itself. I think you might be better off focusing on a very simple engine (potentially even text based -- There are some very fun text-based games out there), and making the difficulty and fun in your game come from the clever AI design part, rather than the graphics.

### How can the project maximize the time spent on language design? How to focus on interesting, possibly new ideas?
You have two people working on this project, so maybe you actually have time for the game engine. I like that it's an RTS, so there are lots of established ideas out there, but not necessarily from an AI perspective. For example, I don't know of many AIs that spread units to avoid splash damage.

I think many AIs are implemented on a per-unit level, and it sounds like you guys might be leaning that way, but it could be cool if you also have a per-army level AI that does things like send ranged units to fight melee units or spread to avoid splash damage, or even surrender at key times.

Overall, I think you guys should make sure to leave significant time to just discuss rules that can be created in your AI, and you should try to design your syntax so that it is easy for you to add new actions/conditions/etc. as you move on in the project if one of you thinks of something super cool that you want to add. Basically, the space of rules for RTS AIs is massive. Your DSL won't cover it all at first, and you should make sure that over time it could eventually expand to cover it all -- Even if that means becoming Turing complete, if it is still implemented in an AI manner I think that is ok.

### What are some interesting language design questions that the work will have to answer? In other words, what are the design challenges? Which design problems' solutions are you looking forward to hearing about at the end of the project?
Given the massive space of RTS AI, I think one of the biggest design challenges will be choosing a subset of that space that is manageable to code in a 5-week timeframe, but also fun to play, and doesn't leave the user feeling too limited in terms of what they are capable of doing.

I also think it will be challenging to balance the game. "What sort of instruction is worth how much IQ, and how do we make it so that some instructions aren't completely OP?" is a question that I am very interested in seeing how you solve. I am also curious to see how many 5 IQ units it takes to kill a 10 IQ unit, when both are programmed well. Is the goal for it to be 2 5 IQ units to a 10 IQ unit, or does the value of IQ scale non-linearly?

### What are the primitives in this language?
I suppose the primitives in your language would be *actions* and *conditions*, so that you can always write a line that does something like 
```if (condition1, condition2, ...) then action1, action2, ....```
Overall, your skeleton syntax seems to be good -- Movement, targetting and grouping are the simplest things I come up with when I think of an RTS AI. More advanced features might include spell-casting (or using abilities in general).

### Do you know of any libraries, languages, or projects that might help this project?
As I mentioned above, there is an Android game that operates on a similar IQ principle, that I will try to get you guys the name of. Aside from that, you seem to have done your research well into game engines and languages.

You might also want to take a look at [Untrusted](http://alexnisnevich.github.io/untrusted/) as an example of a fun game with an exceedingly simple game engine, to keep in mind minimizing the work on the game engine and maximizing the work on the DSL. Don't spend too much time playing though... Or do, and call it gruelling classwork :p

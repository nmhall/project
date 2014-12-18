
#Gruver and Nathan's Awesome RTS command language!

This is our final project for CS111 (Domain specific languages)! This repository contains
a Spring game, a generalized AI for that game, and code capable of parsing the 
language we want to feed commands to that AI in. The link between the AI and the parser
is still a work in progress, but we're proud of how far we've made it in a few short weeks!

#How to write a program

1) Using the structure in EmptyAI.txt, decide what you want to write and fill in the units.
For information on exactly what you can say, check out AIHowTo.md in our documents folder.
For an example of an AI that parses successfully, check SampleAI.txt in our documents
folder. Write your program in a text file and save it in the directory that has the rest of
the project code.

2) In that directory, run in the command line:

python SingleAIParserImplementation.py your-file.txt allAIs

(The last command signals which rule should be used as a starting point for the parser.
Don't worry about ever changing it, although you can if you really want to and you aren't
trying to write an entire AI file).

This will output a String representation of your AST after parsing if you have followed our
syntax and haven't gone over your IQ limitations, as well as the JSON representation of the
AST.

#How to compile and run
To set up the spring game you'll need to follow the following instructions. 

1) You'll need a windows computer. While Spring also works on linux (and we'd be happy
to help you set up our game on a linux computer) we only have experience running our
game on windows machines. 

2) Download Spring lobby here - http://springrts.com/wiki/Download.

3) Download a map here - http://springfiles.com/spring/spring-maps?order=count&sort=desc.
Any map will do, but for the sake of our game it might be nice to pick something simple.
After downloading the map, move it to "My Documents\My Games\Spring\Maps". From there,
Spring lobby will be able to find the map (although you'll have no games installed at this
point).

4) Clone the repository. Copy the SpringGame directory to "My Documents\My Games\Spring\Games". 
If you go to Tools -> Reload Maps/Games, you should see the game appear!

5) Move the GameAI directory to: "Local Disk(C:)\Program Files (x86)\Spring\AI\Skirmish".
If you Reload Maps/Games again you should be able to select GameAI from the Add Bot menu
in the bottom right hand corner of the spring lobby. 

6) If you press start the game should launch and you should see an AI with the same
units as you begin to attack your units! This is the final demo of our game/AI.

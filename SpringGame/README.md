This directory contains all of the fules necessary to run a Spring game. We'll explain 
a few of the most important files here, but if you want more information more details 
can be found at www.springrts.com. 

LuaRules/LuaUI: These directories contain the information necessary for lua scripts
to run within the engine. These scripts are used to spawn players and encode special
behaviors for units that the engine doesn not provide options for. The most important 
file here is LuaRules/Gagets/spawnPlayer.lua, which is responsible for giving units
to each player (either AI or human controlled). By modifying this script, it is possible
to customize the game by altering the starting units.

bitmaps: This file contains the bitmaps used to display visual effects, e.g. the effects
used for movement and weapon firing. Most of these bitmaps were taken from the game Kernel
Panic, which freely distributed them as long as the source game was attributed.

gamedata: This directory contains essential data about the nature of the game. 
    movedefs.lua defines how each unit in the game should move, what its collision 
        radius should be, ect. 
    
    Armordefs.lua defines the different armor types that exist in the game. Specifically,
        it declares the amount of damage that different type weapon will do to each other
        unit.
    
    sidedata.lua defines the different playable factions that exist in a given game.
    
    Much more data exists about these files on the spring website! This Readme is only going
    to provide a short overview for each part of the game. 

objects3d: This directory contains the texture files necessary for the engine to 
render units in the game. Again, most of these textures were lovingly copied from the
game Kernel Panic. 

units: This directory contains definitions of all of the units that exist in the game. 
Each lua file here defines a different unit, and outlines the different aspects of that 
unit. More documentation can be found here.


The rest of the files in this directory were essentially unused in our game, but they
have to exist for the engine to function properly. 
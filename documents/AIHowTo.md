## How do I define an AI? ##
First, there are 3 different types of unit in the game: **short**, which has an IQ of 2,
**int**, which has an IQ of 4, and **double**, which has an IQ of six. IQ determines how
many instructions you are allowed to give that unit! If you try to use more than the
allowed number, you'll get an error. Now, let's take a look at how you give an instruction
to a unit.

### Categories ###
There are three categories of instructions you can give a unit, which we call **formation**,
**movement**, and **targeting**. An instruction looks like a **condition** and then a
**behavior**. You can use the same conditions for every category, and the behaviors will
be specific to the category. The idea is that whenever your AI 
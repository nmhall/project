## Introduction: Describe your domain and motivate the need for a DSL (i.e., how could domain-experts use and benefit from a DSL?). What is the essence of your language, and why is it a good language for this domain?

Our DSL allows users to write an AI program for an RTS (Real-Time Strategy) game. Specifically,
it allows you to write instructions for three types of unit in a game of our creation. Each
type of unit has an *IQ* which dictates how many instructions you can write in your program.
Programs are created by filling out a text file with descriptions of the desired behavior for
each type of unit. Users choose from a set of meaningful conditions, and select a behavior
for the unit to follow under that condition, as well as being able to give a default behavior.
By providing a meaningful and interesting set of conditions and behaviors for the user to
choose from, we make it easy for them to take strategic concepts and make them a reality in
a more direct fashion than if they had to go through the full implementation process
themselves.

## Language design details: Give a high-level overview of your language's design. Be sure to answer the following questions:

#### How does a user write programs in your language (e.g., do they type in commands, use a visual/graphical tool, speak, etc.)?

A user fills in a skeleton text file with various rules for their units. This text file is
passed to a parsing Python program.

#### How does the syntax of your language help users write programs more easily than the syntax of a general-purpose language?

We do borrow heavily from the idea and syntax of a switch or case statement in
general-purpose languages. However, our language is focused much more heavily on simply
stating what a unit should do under a certain condition, and our syntax reflects that
by allowing more sentence-like rules without unnecessary parentheses, dots, or other
artifacts of programming languages that have no actual bearing on what the user is trying
to communicate through their program.


#### What is the basic computation that your language performs (i.e., what is the computational model)?

The basic computation is matching a single user-supplied condition internally in a game, and
having the AI behave according to the corresponding user-supplied behavior. These are combined
together to form an actual AI capable of playing a simple RTS (admittedly probably not very well).

#### What are the basic data structures in your DSL, if any? How does a the user create and manipulate data?

The basic data structure is a rule, which is a set of conditions and a behavior to follow if
those conditions are met within the game. These are combined to define the behavior for a
category (formation, movement, or targeting), all three of which combine to define a single
unit. A definition for each of the three units defines an AI.

#### What are the basic control structures in your DSL, if any? How does the user specify or manipulate control flow?

There is no real control flow in our language. The user simply supplies condition-based
rules, which are checked against the current state of the game on a frame-by-frame
basis.

#### What kind(s) of input does a program in your DSL require? What kind(s) of output does a program produce?

Our DSL requires a text input obeying our syntax. The output at the moment is a nicely
structured AST in JSON format. In an ideal world, this would be passed into our actual
AI program and re-interpreted as commands to the AI. However, time did not end up allowing
for this to happen. At a design level, however, the true output is an actual AI capable
of playing our game.

#### Error handling: How can programs go wrong, and how does your language communicate those errors to the user?

Syntax errors simply fail to parse, and Grako (our chosen Python parser) produces pretty
reasonable errors on syntax failure. If the user violates the IQ limits, we have our own
post-processing which raises a meaningful exception alerting them to the issue.

#### What tool support (e.g., error-checking, development environments) does your project provide?

We have basically zero of that right now. User input is in a simple text file, which is
then passed without any modification into the Grako-generated parser.

#### Are there any other DSLs for this domain? If so, what are they, and how does your language compare to these other languages?

To our knowledge, no DSLs exist for this domain. You could maybe argue that a framework
like Spring contains a very large internal DSL for AI creation. However, there are two
things which make our AI fundamentally different. First, the Spring AI system is extremely
verbose, and is really a library in the sense that while it provides some new syntax,
it doesn't really define its own syntax but instead simply defines a few methods you can
call in Java. Second, our language is specifically designed and written to focus on
strategic decision-making rather than implementation. Even if you were to count Spring's
libraries as an internal DSL, it's not really in the same domain as ours. It allows a
user to implement an AI agent, while we allow a user to describe the intended behavior
of an AI in strategic, rather than game- or implementation-specific terms.

#### Example program(s): Provide one or more examples that give the casual reader a good sense of your language. Include inputs and outputs. Think of this section as “Tutorial By Example”. You might combine this section with the previous one, i.e., use examples to help describe your language.

Here is what a legal AI definition might look like:

Short{

Formation{

}

Movement{

  if there are 3 enemies adjacent: move away
  
}

Targeting{

  default: target lowest health
  
}

}

Int{

Formation{

  if there are 4 allies adjacent: tight formation
  
}

Movement{

  if a nearby enemy has health < 50 and my health > 60: move away
  
  if my health < 20: hold ground
  
}

Targeting{

  default: target closest
  
}

}

Double{

Formation{

  if my health > 70: tight formation
  
  default: isolation
  
}

Movement{

  if my health < 50: move away
  
  default: hold ground
  
}

Targeting{

  if a nearby enemy has IQ > 4: target smartest
  
  default: target lowest health
  
}

}

This example can also be found in SampleAI.txt. The output as a JSON representaiton of the
AST can be found in SampleOutput.txt (along with Grako's String representation of the tree),
and looks like this:

{
  "dumbAI": {
    "singleDumbAI": {
      "formationDef": {
        "formationRules": null
      }, 
      "movementDef": {
        "movementRules": {
          "extraMovementRules": {
            "movementRule": {
              "conditional": {
                "condition": {
                  "enemyProximity": {
                    "number": "3", 
                    "proximity": "adjacent"
                  }, 
                  "allyProximity": null, 
                  "myHealth": null, 
                  "enemyIQ": null, 
                  "enemyHealth": null, 
                  "enemyRange": null
                }
              }, 
              "movement": {
                "movement": "move away"
              }
            }
          }, 
          "defaultMovement": null
        }
      }, 
      "targetingDef": {
        "targetingRules": {
          "defaultTargeting": {
            "targeting": "target lowest health"
          }, 
          "extraTargetingRules": null
        }
      }
    }
  }, 
  "mediumAI": {
    "singleMediumAI": {
      "formationDef": {
        "formationRules": {
          "extraFormationRules": {
            "formationRule": {
              "conditional": {
                "condition": {
                  "allyProximity": {
                    "number": "4", 
                    "proximity": "adjacent"
                  }, 
                  "enemyProximity": null, 
                  "myHealth": null, 
                  "enemyIQ": null, 
                  "enemyHealth": null, 
                  "enemyRange": null
                }
              }, 
              "formation": {
                "formation": "tight formation"
              }
            }
          }, 
          "defaultFormation": null
        }
      }, 
      "movementDef": {
        "movementRules": {
          "extraMovementRules": {
            "movementRule": [
              {
                "conditional": {
                  "condition": {
                    "enemyHealth": {
                      "comparison": "<", 
                      "number": "50"
                    }, 
                    "enemyProximity": null, 
                    "allyProximity": null, 
                    "myHealth": null, 
                    "enemyIQ": null, 
                    "enemyRange": null
                  }
                }, 
                "movement": {
                  "movement": "move away"
                }
              }, 
              {
                "conditional": {
                  "condition": {
                    "myHealth": {
                      "comparison": "<", 
                      "number": "20"
                    }, 
                    "enemyProximity": null, 
                    "allyProximity": null, 
                    "enemyIQ": null, 
                    "enemyHealth": null, 
                    "enemyRange": null
                  }
                }, 
                "movement": {
                  "movement": "hold ground"
                }
              }
            ]
          }, 
          "defaultMovement": null
        }
      }, 
      "targetingDef": {
        "targetingRules": {
          "defaultTargeting": {
            "targeting": "target closest"
          }, 
          "extraTargetingRules": null
        }
      }
    }
  }, 
  "smartAI": {
    "singleSmartAI": {
      "formationDef": {
        "formationRules": {
          "extraFormationRules": {
            "formationRule": {
              "conditional": {
                "condition": {
                  "myHealth": {
                    "comparison": ">", 
                    "number": "70"
                  }, 
                  "enemyProximity": null, 
                  "allyProximity": null, 
                  "enemyIQ": null, 
                  "enemyHealth": null, 
                  "enemyRange": null
                }
              }, 
              "formation": {
                "formation": "tight formation"
              }
            }
          }, 
          "defaultFormation": {
            "formation": "isolation"
          }
        }
      }, 
      "movementDef": {
        "movementRules": {
          "extraSmartMovementRules": {
            "movementRule": {
              "conditional": {
                "condition": {
                  "myHealth": {
                    "comparison": "<", 
                    "number": "50"
                  }, 
                  "enemyProximity": null, 
                  "allyProximity": null, 
                  "enemyIQ": null, 
                  "enemyHealth": null, 
                  "enemyRange": null
                }
              }, 
              "movement": {
                "movement": "move away"
              }
            }
          }, 
          "defaultMovement": {
            "movement": "hold ground"
          }, 
          "extraMovementRules": null
        }
      }, 
      "targetingDef": {
        "targetingRules": {
          "extraTargetingRules": {
            "targetingRule": {
              "conditional": {
                "condition": {
                  "enemyIQ": {
                    "comparison": ">", 
                    "number": "4"
                  }, 
                  "enemyProximity": null, 
                  "allyProximity": null, 
                  "myHealth": null, 
                  "enemyHealth": null, 
                  "enemyRange": null
                }
              }, 
              "targeting": {
                "targeting": "target smartest"
              }
            }
          }, 
          "defaultTargeting": {
            "targeting": "target lowest health"
          }
        }
      }
    }
  }
}

Unfortunately, there are a lot of nulls in the output due to some artifacts from
how the generated parser works, but the user would never be actual subjected to this
JSON output.

## Language implementation: Describe your implementation. In particular, answer the following questions:

#### What host language did you use (i.e., in what language did you implement your DSL)? Why did you choose this host language (i.e., why is it well-suited for your language design)?

Our host language for parsing of the user AI definition is Python. This was chosen for
the convenience of using Grako to automatically generate a parser from a grammar in
EBNF. The language in which our actual AI is Java, using a library that comes
along with the Spring game engine. Our game is written in Lua.

#### Is yours an external or an internal DSL (or some combination thereof)? Why is that the right design?

Our DSL is external, written in a text file and parsed in Python as mentioned above.
This is the right design decision because our goal is to allow the user to express
strategic decisions rather than worry about implementation. For this reason, we wanted
to give them a non-programming language way to express themselves without having the
clutter of programming language artifacts. As can be seen in our example program, we
do borrow heavily from the structure of programming languages for object-style
definitions and what are essentially switch statements. However, our conditions and
behaviors make a lot more sense when the user can simply express the strategies that
they want, rather than thinking about calling methods or anything like that.

#### Provide an overview of the architecture of your language: front, middle, and back-end, along with any technologies used to implement these components.

Front-end is the text file facing the user, combined with Grako for parsing their
input. Grako takes our language grammar in EBNF and automatically generates a
Python file to act as a parser for the language. The grammar also allows you to
control at a pretty impressive level the structure of the resulting AST, so that we
can parse in a way that lends itself well to interpretation as AI instructions.

In the middle, we have a layer of semantics to enforce our IQ limitations. Grako
provides a very convenient way to do this while parsing, so that we can immediately
fail and raise an appropriate exception if the user has given too many rules.

At the back end, we have the Spring library-using code that defines our AI. Right
now, our own behavior is implemented here. At full completion, we would have a lot
of the same code combined with a method to read in and interpret the JSON AST as
commands for the AI. We would then test whether the game conditions matched those
in a user-given rule and take the appropriate action. Since there are a finite
number of behaviors suppliable, we can easily write a general AI file which knows
how to follow a user's behavior at any point in time. In addition to the AI back
end, we have the code which actually defines the game and units for the Spring game
engine. This is not as directly related to our language since the game can actually
be played with human input rather than an AI controlling, but is part of the
framework necessary for our language to work.

#### “Parsing”: How does your DSL take a user program and turn it into something that can be executed? How do the data and control structures of your DSL connect to the underlying semantic model?

As mentioned many times previously, our language is parsed using an
automatically-generated parser in Python created by Grako from our EBNF grammar.
The resulting AST preserves the concepts of different units, as well as the
connection between conditions and behaviors. This allows any interpreting
program (in particular, our AI) to semantically interpret that information as
instructions about a particular unit's behavior at specific points in the game.

#### Intermediate representation: What data structure(s) in the host language do you use to represent a program in your DSL?

#### Execution: How did you implement the computational model? Describe the structure of your code and any special programming techniques you used to implement your language. In particular, how do the semantics of your host language differ from the semantics of your DSL?

## Evaluation: Provide some analysis of the work you did. In particular:

#### How “DSL-y” is your language? How close or far away is it from a general- purpose language?

#### What works well in your language? What are you particularly pleased with?

#### What could be improved? For example, how could the user's experience be better? How might your implementation be simpler or more cohesive? Are there more features you'd like to have? Does your current implementation differ from your larger vision for the language?


#### Re-visit your evaluation plan from the beginning of the project. Which tools have you used to evaluate the quality of your design? What have you learned from these evaluations? Have you made any significant changes as a result of these tools, the critiques, or user tests?

#### Where did you run into trouble and why? For example, did you come up with some syntax that you found difficult to implement, given your host language choice? Did you want to support multiple features, but you had trouble getting them to play well together?



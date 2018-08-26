---
tags:
- rpgs
- gaming
- world simulation
layout: story
title: Some ideas concerning RPGs
created: 1107132560
---
<h3>Introduction</h3>

Computer role playing games (RPGs) are a very popular form of entertainment. They allow the player to assume a new character in a different world, and either may be as far from reality as desired. The game is much like a book, except that the player is the main character, and often can influence what happens.<!--break-->

<h3>Current limitations</h3>

However, in the current generation of RPGs the player's interaction in the world is very limited. Developers take the approach of designing in every detail, every allowed action, conversation phrase, and plot twist, which leads to a restrictive and unrealistic world. How many times has everyone you talked to had ''exactly'' the same answer to your question? How many people with the same face have you seen?

Character creation too is usually quite unrealistic. Is there any reason why, once a character has gained a certain number of 'experience points' they 'level up' and all their basic characteristics improve? Fighting cannot make you more intelligent, and casting magic spells should not make you tougher! The character level is an arbitrary distinction;  increases in capabilities should be directly linked to what the character does, and not directly chosen by the player. 

These games also often display a remarkable lack of consistency. Bandits seem far more common than peasants, and predators outnumber their prey. Magic works by waving your hands and chanting mystical verses - the only way this makes sense is if the objects you are trying to affect can understand! Many of these worlds simply could not function, and once the player realises this the suspension of disbelief is broken.


<h3>The solution</h3>

<h4>The roleplaying system</h4>
The first aim of this project is to act as a critique of current popular roleplaying systems and to describe a possible alternative, complete with skill, ability, magic, fighting and conversational systems, yet fully extensible to support any science fiction or fantasy world.


<h4>The asset generation system</h4>

The second aim is much more ambitious: to describe and detail a new approach to solving the uniqueness problem. Simply put, the world must be described as abstractly as possible, and this data can be manipulated programmatically to create new content.

Is every character model the same? Describe them by their weight, height, girth, hair colour, eye separation... with enough parameters, no model needs to be the same.


<h4>The character simulation system</h4>

The third aim is to create a system to use abstract data to make non-player characters (NPCs) unique and believable, by simulating the behaviour of a character. Define their characteristics, their culture, what they know, their mannerisms, and the program can decide what they say and how they react. They can go to the shops, gossip and generally go about their everyday business.


<h4>The world simulation system</h4>

Ideally, no world should be fixed. If the player wants to do something, there should be no artificial barriers to their actions. But they should have to face the consequences. That is the aim of this system. With defined groups, factions and beliefs among the NPCs, the whole world can react. The NPCs decide what happens.


<h4>Modularity and integration</h4>
An advantage of these systems is that, if their interfaces are defined well, they can be completely modular and updateable. They have very broad remits - ideally, each should be further divided up, for optimum extensibility.

If you want to add more detail to the characters, just change the character model module. It could be changed to use the character's strength to determine the size of the model's muscles. To add more varied phrases to conversation, make a more advanced speech renderer. Even if not all the detail will be immediately useful, you may be able to take advantage of it with future technology. 

<h3>Conclusion</h3>

Making this approach work completely may not be possible. But we won't know if we don't have a good think about it. That's what this is for &mdash; so people can share their thoughts. 

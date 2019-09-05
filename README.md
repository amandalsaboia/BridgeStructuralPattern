# BridgeStructuralPattern
Bridge is a structural design pattern that lets you split a large class or a set of closely related classes into two separate 
hierarchies—abstraction and implementation—which can be developed independently of each other.
The GoF book  introduces the terms Abstraction and Implementation as part of the Bridge definition. In my opinion, the terms sound 
too academic and make the pattern seem more complicated than it really is. 
Having read the simple example with shapes and colors, let’s decipher the meaning behind the GoF book’s scary words.
Abstraction (also called interface) is a high-level control layer for some entity. This layer isn’t supposed to do any real work on its own. It should delegate the work to the implementation layer (also called platform).

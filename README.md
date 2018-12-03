# RememberMe
A script made for RPG Maker VX Ace to simulate Undertale's "after-game memory"

# Install:
Just copy the script in a section above Main (right where RPG Maker suggests you to put it!)

# Using the script:
The system makes use of two variables which you can easily modify in the script itself.
You get to write on a game variable (one _actual_ game variable) the info you want to pass.
It can be anything! If you want to keep the Undertale idea as an example, it could contain a value 0-100 on your alignment in the previous savefile.
Once you proceed to play a New Game, the game will read the variable from the latest savefile you have in the folder and will store it into another variable.

This way you can make a game "remember" some previous data.
Of course with a little editing it's possible to pass more informations (i.e. more variables).

A suggestion on how to pass multiple boolean values through one single variable, though, is to use numbers that are __power of 2__ which is a quite useful method.

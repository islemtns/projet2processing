Flappy Bird in Processing
A simple Flappy Bird game made in Processing. The game features a bird that must fly through obstacles to gain points. If the bird hits an obstacle, the game is over.

Parameters
The game has several constants that define its parameters:

OBSTACLE_COUNT: the number of obstacles in the game
OBSTACLE_SPEED: the speed at which obstacles move
BIRD_JUMP_FORCE: the force with which the bird jumps
TEXT_SIZE: the size of the text that displays the score
START_TEXT_SIZE: the size of the text that displays the start message
How to Play
Press the space bar to make the bird jump. If the bird hits an obstacle, the game is over. Press Enter to start a new game.

Classes
Bird
The Bird class represents the bird in the game. It has the following properties:

x: the bird's horizontal position
y: the bird's vertical position
sizeX: the bird's size on the X-axis
sizeY: the bird's size on the Y-axis
velocity: the bird's velocity
gravity: the gravity affecting the bird
img: the image representing the bird
Obstacle
The Obstacle class represents the obstacles in the game. It has the following properties:

x: the obstacle's horizontal position
y: the obstacle's vertical position
speed: the speed at which the obstacle moves
imgTop: the image representing the top of the obstacle
imgBottom: the image representing the bottom of the obstacle
Credits
This game was created by TOUNSI Islam. The font used in this game was sourced from [your font source here].

Acknowledgements
This game was created as a learning exercise based on the Flappy Bird game.

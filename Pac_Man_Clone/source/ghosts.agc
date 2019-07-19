
/*
CONTRIBUTORS:
	SpeckyYT
	
DATE:
	last updated 07/19/2019 by SpeckyYT
	
PURPOSE:
	The ghost's AI and other stuff.

DOCUMENTATION:
	
	Direction: 0 (north) / 1 (east) / 2 (south) / 3 (west)

FUNCTIONS:
	
	
EXAMPLE:

*/



type Blinky
	posX as integer			//Ghost's X position
	posY as integer			//Ghost's Y position
	dir as integer				//Ghost's facing direction
	house as integer			//If ghost is in the Ghost House or not
	state as integer			//0 (eaten) / 1 (chase) / 2 (scatter) / 3 (frightened)
	targetX as integer		//Ghost's target's X position
	targetY as integer		//Ghost's target's Y position
endtype

type Pinky
	posX as integer				//Ghost's X position
	posY as integer				//Ghost's Y position
	dir as integer					//Ghost's facing direction
	house as integer				//If ghost is in the Ghost House or not
	state as integer				//0 (eaten) / 1 (chase) / 2 (scatter) / 3 (frightened)
	targetX as integer			//Ghost's target's X position
	targetY as integer			//Ghost's target's Y position
	targetHelpX as integer	//Help for the "misalignment" of the target (X)
	targetHelpY as integer	//Help for the "misalignment" of the target (Y)
endtype

type Inky
	posX as integer			//Ghost's X position
	posY as integer			//Ghost's Y position
	dir as integer				//Ghost's facing direction
	house as integer			//If ghost is in the Ghost House or not
	state as integer			//0 (eaten) / 1 (chase) / 2 (scatter) / 3 (frightened)
	targetX as integer		//Ghost's target's X position
	targetY as integer		//Ghost's target's Y position
endtype

type Clyde
	posX as integer			//Ghost's X position
	posY as integer			//Ghost's Y position
	dir as integer				//Ghost's facing direction
	house as integer			//If ghost is in the Ghost House or not
	state as integer			//0 (eaten) / 1 (chase) / 2 (scatter) / 3 (frightened)
	targetX as integer		//Ghost's target's X position
	targetY as integer		//Ghost's target's Y position
endtype





function updateGhostTarget()
	
	//Blinky
	Blinky.targetX = pacman.posX
	Blinky.targetY = pacman.posY
	
	//Pinky
	if pacman.dir = 0
		Pinky.targetHelpX = -4
		Pinky.targetHelpY = -4
	elseif pacman.dir = 1
		Pinky.targetHelpX = 4
		Pinky.targetHelpY = 0
	elseif pacman.dir = 2
		Pinky.targetHelpX = 0
		Pinky.targetHelpY = 4
	elseif pacman.dir = 3
		Pinky.targetHelpX = -4
		Pinky.targetHelpY = 0
	endif
	
	Pinky.targetX = pac-man.posX + Pinky.targetHelpX
	Pinky.targetY = pac-man.posY + Pinky.targetHelpY
	
	
	
endfunction

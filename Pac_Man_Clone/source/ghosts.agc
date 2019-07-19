
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



type Ghost
	posX as integer			//Ghost's X position
	posY as integer			//Ghost's Y position
	dir as integer				//Ghost's facing direction
	house as integer		//If ghost is in the Ghost House or not
	state as integer			//0 (eaten) / 1 (chase) / 2 (scatter) / 3 (frightened)
	targetX as integer		//Ghost's target's X position
	targetY as integer		//Ghost's target's Y position
	targetHelpX as integer	//Help for the "misalignment" of the target (X)
	targetHelpY as integer	//Help for the "misalignment" of the target (Y)
	distToPac as integer		//Ghost's distance to Pac-Man
endtype



global ghostB as Ghost
global ghostP as Ghost
global ghostI as Ghost
global ghostC as Ghost



function updateScatterHomes()
	
	#constant BscatterHomeX = 30 
	#constant BscatterHomeY = 1

	#constant PscatterHomeX = 1
	#constant PscatterHomeY = 1

	#constant IscatterHomeX = 30
	#constant IscatterHomeY = 30

	#constant CscatterHomeX = 1
	#constant CscatterHomeY = 30

endfunction



function updateGhostTarget()
	
	updateScatterHomes()
	
	//Blinky
	ghostB.targetX = pacman.posX
	ghostP.targetY = pacman.posY
	
	
	
	//Pinky
	if pacman.dir = 0
		ghostP.targetHelpX = -4
		ghostP.targetHelpY = -4
	elseif pacman.dir = 1
		ghostP.targetHelpX = 4
		ghostP.targetHelpY = 0
	elseif pacman.dir = 2
		ghostP.targetHelpX = 0
		ghostP.targetHelpY = 4
	elseif pacman.dir = 3
		ghostP.targetHelpX = -4
		ghostP.targetHelpY = 0
	endif
	
	ghostP.targetX = pacman.posX + ghostP.targetHelpX
	ghostP.targetY = pacman.posY + ghostP.targetHelpY
	
	
	
	//Inky
	if pacman.dir = 0
		ghostI.targetHelpX = -2
		ghostI.targetHelpY = -2
	elseif pacman.dir = 1
		ghostI.targetHelpX = 2
		ghostI.targetHelpY = 0
	elseif pacman.dir = 2
		ghostI.targetHelpX = 0
		ghostI.targetHelpY = 2
	elseif pacman.dir = 3
		ghostI.targetHelpX = -2
		ghostI.targetHelpY = 0
	endif
	
	ghostI.targetHelpX = pacman.posX + ghostI.targetHelpX - ghostB.posX
	ghostI.targetHelpY = pacman.posY + ghostI.targetHelpY - ghostB.posY
	
	
	
	//Clyde
	ghostC.distToPac = sqrt(((ghostC.posX - pacman.posX) * (ghostC.posX - pacman.posX)) + ((ghostC.posY - pacman.posY) * (ghostC.posY - pacman.posY)))
	if  ghostC.distToPac > 8
		ghostC.targetX = pacman.posX
		ghostC.targetY = pacman.posY
	else
		ghostC.targetX = CscatterHomeX
		ghostC.targetY = CscatterHomeY
	endif
	
endfunction

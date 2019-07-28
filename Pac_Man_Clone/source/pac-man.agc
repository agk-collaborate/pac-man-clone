/*
CONTRIBUTORS:
	SpeckyYT
	
DATE:
	last updated 07/19/2019 by SpeckyYT
	
PURPOSE:
	Pac-Man's positions and movement.

DOCUMENTATION:
	Direction: 0 (north) / 1 (west) / 2 (south) / 3 (est)
	
FUNCTIONS:
	
EXAMPLE:

*/

type pacman
	pos as	t_Vector_2			//Pac-Man's position (x and y)
	dir as integer					//Pac-Man's facing direction
endtype

global pacman as pacman

function updatePacManDirection()
	
	if KEY_UP_STATE
		
		pacman.dir = 0
		exitfunction
		
	elseif KEY_LEFT_STATE
		
		pacman.dir = 1
		exitfunction
	
	elseif KEY_DOWN_STATE
		
		pacman.dir = 2
		exitfunction
	
	elseif KEY_RIGHT_STATE
		
		pacman.dir = 3
		exitfunction
	
	endif
	
endfunction

function updatePacManPosition()
	
	if pacman.dir = 0
		
		pacman.pos.y =  pacman.pos.y - 1
	
	elseif pacman.dir = 1
		
		pacman.pos.x = pacman.pos.x - 1
	
	elseif pacman.dir = 2
		
		pacman.pos.y = pacman.pos.y + 1
		
	elseif pacman.dir = 3
		
		pacman.pos.x = pacman.pos.x + 1
	
	endif
	
endfunction

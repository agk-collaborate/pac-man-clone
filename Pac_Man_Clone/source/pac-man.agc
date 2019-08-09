/*
CONTRIBUTORS:
	SpeckyYT
	IronManhood
	
DATE:
	last updated 08/09/2019 by IronManhood
	
PURPOSE:
	Pac-Man's positions and movement.

DOCUMENTATION:

	Direction: 0 (north) / 1 (west) / 2 (south) / 3 (east)
	
FUNCTIONS:
	
	void <-- CreatePacMan()
	
	void <-- updatePacManDirection()
	
	void <-- updatePacManPosition()
	
EXAMPLE:

*/

type pacman
	pos as	t_Vector_2			//Pac-Man's position (x and y)
	size as t_Vector_2			// Pac-Man's size (width & height)
	dir as integer					//Pac-Man's facing direction
	
	created as integer			// Will skip update calls if not created.
endtype

global pacman as pacman


function CreatePacMan(_pm ref as pacman, _map as t_Map)
	if not _pm.created
		_pm.created = TRUE
		_pm.pos = GetPMSpawnPosition(_map)
		_pm.size = vec2_1(_map.gridSize * 0.45)
	endif
endfunction


function DeletePacMan(_pm ref as pacman)
	_pm.pos = vec2_1(0.0)
	_pm.size = vec2_1(0.0)
	_pm.dir = 0
	_pm.created = FALSE
endfunction


function updatePacManDirection(_pm ref as pacman)
	
		if KEY_UP_STATE
			
			_pm.dir = 0
			exitfunction
			
		elseif KEY_LEFT_STATE
			
			_pm.dir = 1
			exitfunction
		
		elseif KEY_DOWN_STATE
			
			_pm.dir = 2
			exitfunction
		
		elseif KEY_RIGHT_STATE
			
			_pm.dir = 3
			exitfunction
		
		endif
		
endfunction

function updatePacManPosition(_pm ref as pacman)
	
		if _pm.dir = 0
			
			_pm.pos.y =  _pm.pos.y - 1
		
		elseif _pm.dir = 1
			
			_pm.pos.x = _pm.pos.x - 1
		
		elseif _pm.dir = 2
			
			_pm.pos.y = _pm.pos.y + 1
			
		elseif _pm.dir = 3
			
			_pm.pos.x = _pm.pos.x + 1
		
		endif
		
endfunction

function UpdatePacman(_pm ref as pacman)
	if _pm.created
		updatePacManDirection(_pm)
		updatePacManPosition(_pm)
		vec2_DrawEllipse(_pm.pos, _pm.size, clr_yellow, clr_yellow, TRUE)
	endif
endfunction

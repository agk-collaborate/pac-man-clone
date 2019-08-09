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
	
	void <-- CreatePacMan(_pm ref as pacman, _map as t_Map)
	
	void <-- DeletePacMan(_pm ref as pacman)
	
	void <-- updatePacManDirection(_pm ref as pacman)
	
	void <-- updatePacManPosition(_pm ref as pacman)
	
	void <-- UpdatePacman(_pm ref as pacman)
	
EXAMPLE:

*/

type pacman
	pos as	t_Vector_2			//Pac-Man's position (x and y)
	size as t_Vector_2			// Pac-Man's size (width & height)
	dir as integer					//Pac-Man's facing direction
	speed as float
	
	created as integer			// Will skip update calls if not created.
endtype

//~global pacman as pacman


function CreatePacMan(_pm ref as pacman, _map as t_Map)
	if not _pm.created
		_pm.created = TRUE
		_pm.dir = -1
		_pm.speed = 100.0
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

function updatePacManPosition(_pm ref as pacman, _map ref as t_Map)
		_ix = GetTileIndexX(_map, _pm.pos.x)
		_iy = GetTileIndexY(_map, _pm.pos.y)
		_tc as t_Vector_2
		_tc = GetTileCenterPos(_map, _iy, _ix)
		
		// For debugging.
		DrawRange(_map.tiles[_iy,_ix].pos, _map.tiles[_iy,_ix].size, clr_cyan, clr_cyan, clr_cyan, clr_cyan, FALSE)
		vec2_DrawEllipse(_tc, vec2_1(4.0), clr_pink, clr_pink, TRUE)
	
		if _pm.dir = 0 // (north)

			dec _pm.pos.y, _pm.speed * GetFrameTime() // Scale by frametime to account for variable frame rate.
			
			// Check for wall collision.
			if _pm.pos.y <= _tc.y
				if _iy - 1 < 0
					
				elseif _map.tiles[_iy - 1,_ix].tileType = TILETYPE_WALL
					_pm.pos.y = _tc.y
					_pm.dir = -1
					DrawRange(_map.tiles[_iy - 1,_ix].pos, _map.tiles[_iy,_ix].size, clr_red, clr_red, clr_red, clr_red, TRUE) // For debugging.
				endif
			endif
		
		elseif _pm.dir = 1 // (west)

			dec _pm.pos.x, _pm.speed * GetFrameTime() // Scale by frametime to account for variable frame rate.
			
			// Check for wall collision.
			if _pm.pos.x <= _tc.x
				if _ix - 1 < 0
					
				elseif _map.tiles[_iy,_ix - 1].tileType = TILETYPE_WALL
					_pm.pos.x = _tc.x
					_pm.dir = -1
					DrawRange(_map.tiles[_iy,_ix - 1].pos, _map.tiles[_iy,_ix].size, clr_red, clr_red, clr_red, clr_red, TRUE) // For debugging.
				endif
			endif
		
		elseif _pm.dir = 2 // (south)

			inc _pm.pos.y, _pm.speed * GetFrameTime() // Scale by frametime to account for variable frame rate.
			
			// Check for wall collision.
			if _pm.pos.y >= _tc.y
				if _iy + 1 > _map.tiles.length - 1
					
				elseif _map.tiles[_iy + 1,_ix].tileType = TILETYPE_WALL
					_pm.pos.y = _tc.y
					_pm.dir = -1
					DrawRange(_map.tiles[_iy + 1,_ix].pos, _map.tiles[_iy,_ix].size, clr_red, clr_red, clr_red, clr_red, TRUE) // For debugging.
				endif
			endif
			
		elseif _pm.dir = 3 // (east)

			inc _pm.pos.x, _pm.speed * GetFrameTime() // Scale by frametime to account for variable frame rate.
			
			// Check for wall collision.
			if _pm.pos.x >= _tc.x
				if _ix + 1 > _map.tiles[0].length - 1
					
				elseif _map.tiles[_iy,_ix + 1].tileType = TILETYPE_WALL
					_pm.pos.x = _tc.x
					_pm.dir = -1
					DrawRange(_map.tiles[_iy,_ix + 1].pos, _map.tiles[_iy,_ix].size, clr_red, clr_red, clr_red, clr_red, TRUE) // For debugging.
				endif
			endif
		
		endif
		
endfunction

function UpdatePacman(_pm ref as pacman, _map ref as t_Map)
	if _pm.created
		updatePacManDirection(_pm)
		updatePacManPosition(_pm, _map)
		vec2_DrawEllipse(_pm.pos, _pm.size, clr_yellow, clr_yellow, TRUE)
	endif
endfunction

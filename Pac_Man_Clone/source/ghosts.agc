/*
CONTRIBUTORS:
	SpeckyYT
	IronManhood
	
DATE:
	last updated 08/09/2019 by IronManhood
	
PURPOSE:
	The ghost's AI and other stuff.

DOCUMENTATION:
	
	Direction: 0 (north) / 1 (west) / 2 (south) / 3 (east)
	Up > Left > Down > Right

FUNCTIONS:
	
	void <-- updateScatterHomes()
	
	void <-- updateGhostTarget()
	
	void <-- updateGhostDirection()
	
	void <-- updateGhostPosition()
	
EXAMPLE:

*/

type Ghost
	aiType as integer				//Ghost's AI type (0 Blinky, 1 Pinky, 2 Inky, 3 Clyde)
	pos as t_Vector_2			//Ghost's position (x and y)
	size as t_Vector_2			// Ghosts' size (width & height)
	target as t_Vector_2		//Ghost's target's position (x and y)
	targetHelp as t_Vector_2	//Help for the "misalignment" of the target (Y)
	dir as integer				//Ghost's facing direction
	house as integer			//If ghost is in the Ghost House or not
	state as integer			//0 (eaten) / 1 (chase) / 2 (scatter) / 3 (frightened)
	distToPac as integer		//Ghost's distance to Pac-Man
	created as integer			// Will skip update calls if not created.
endtype

global ghostB as Ghost[10]
global ghostP as Ghost
global ghostI as Ghost
global ghostC as Ghost

global BscatterHome as t_Vector_2
global PscatterHome as t_Vector_2
global IscatterHome as t_Vector_2
global CscatterHome as t_Vector_2

function updateScatterHomes()
	
	BscatterHome.X = 30 
	BscatterHome.Y = 1

	PscatterHome.X = 1
	PscatterHome.Y = 1

	IscatterHome.X = 30
	IscatterHome.Y = 30

	CscatterHome.X = 1
	CscatterHome.Y = 30

endfunction

function updateGhostTarget(_pm as pacman)
	
	updateScatterHomes()
	
		
		//Blinky
		for B = 1 to ghostB.length
			ghostB[B].target.x = _pm.pos.x
			ghostB[B].target.y = _pm.pos.y
		next
			
		//Pinky
		if _pm.dir = 0
			ghostP.targetHelp.X = -4
			ghostP.targetHelp.Y = -4
		elseif _pm.dir = 1
			ghostP.targetHelp.X = 4
			ghostP.targetHelp.Y = 0
		elseif _pm.dir = 2
			ghostP.targetHelp.X = 0
			ghostP.targetHelp.Y = 4
		elseif _pm.dir = 3
			ghostP.targetHelp.X = -4
			ghostP.targetHelp.Y = 0
		endif
		
		ghostP.target.X = _pm.pos.X + ghostP.targetHelp.X
		ghostP.target.Y = _pm.pos.Y + ghostP.targetHelp.Y
		
		//Inky
		if _pm.dir = 0
			ghostI.targetHelp.X = -2
			ghostI.targetHelp.Y = -2
		elseif _pm.dir = 1
			ghostI.targetHelp.X = 2
			ghostI.targetHelp.Y = 0
		elseif _pm.dir = 2
			ghostI.targetHelp.X = 0
			ghostI.targetHelp.Y = 2
		elseif _pm.dir = 3
			ghostI.targetHelp.X = -2
			ghostI.targetHelp.Y = 0
		endif
		
		ghostI.targetHelp.X = _pm.pos.X + ghostI.targetHelp.X - ghostB[1].pos.X
		ghostI.targetHelp.Y = _pm.pos.Y + ghostI.targetHelp.Y - ghostB[1].pos.Y
		
		//Clyde
		ghostC.distToPac = vec2_Distance(ghostC.pos, _pm.pos)
		if  ghostC.distToPac > 8
			ghostC.target.X = _pm.pos.X
			ghostC.target.Y = _pm.pos.Y
		else
			ghostC.target.X = CscatterHome.X
			ghostC.target.Y = CscatterHome.Y
		endif
	
endfunction

function updateGhostDirection()
	
endfunction

function updateGhostPosition()
	
	//Blinky
for B = 1 to ghostB.length
	if ghostB[B].created = 1
		if ghostB[B].dir = 0
			
			ghostB[B].pos.y = ghostB[B].pos.y - 1
		
		elseif ghostB[B].dir = 1
			
			ghostB[B].pos.x = ghostB[B].pos.x - 1
		
		elseif ghostB[B].dir = 2
			
			ghostB[B].pos.y = ghostB[B].pos.y + 1
			
		elseif ghostB[B].dir = 3
			
			ghostB[B].pos.x = ghostB[B].pos.x + 1
		
		endif
		vec2_DrawEllipse(ghostB[B].pos, ghostB[B].size, clr_red, clr_red, TRUE)
	endif
next

	//Pinky
	if ghostP.created = 1
		if ghostP.dir = 0
			
			ghostP.pos.y =  ghostP.pos.y - 1
		
		elseif ghostP.dir = 1
			
			ghostP.pos.x = ghostP.pos.x - 1
		
		elseif ghostP.dir = 2
			
			ghostP.pos.y = ghostP.pos.y + 1
			
		elseif ghostP.dir = 3
			
			ghostP.pos.x = ghostP.pos.x + 1
		
		endif
		vec2_DrawEllipse(ghostP.pos, ghostP.size, clr_pink, clr_pink, TRUE)
	endif
	
	//Inky
	if ghostI.created = 1
		if ghostI.dir = 0
			
			ghostI.pos.y =  ghostI.pos.y - 1
		
		elseif ghostI.dir = 1
			
			ghostI.pos.x = ghostI.pos.x - 1
		
		elseif ghostI.dir = 2
			
			ghostI.pos.y = ghostI.pos.y + 1
			
		elseif ghostI.dir = 3
			
			ghostI.pos.x = ghostI.pos.x + 1
		
		endif
		vec2_DrawEllipse(ghostI.pos, ghostI.size, clr_cyan, clr_cyan, TRUE)
	endif
	
	//Clyde
	if ghostC.created = 1
		if ghostC.dir = 0
			
			ghostC.pos.y =  ghostC.pos.y - 1
		
		elseif ghostC.dir = 1
			
			ghostC.pos.x = ghostC.pos.x - 1
		
		elseif ghostC.dir = 2
			
			ghostC.pos.y = ghostC.pos.y + 1
			
		elseif ghostC.dir = 3
			
			ghostC.pos.x = ghostC.pos.x + 1
		
		endif
		vec2_DrawEllipse(ghostC.pos, ghostC.size, clr_orange, clr_orange, TRUE)
	endif
endfunction

function UpdateGhosts(ghostB ref as Ghost, ghostP ref as Ghost, ghostI ref as Ghost, ghostC ref as Ghost)
	updateGhostDirection()
	updateGhostPosition()
endfunction

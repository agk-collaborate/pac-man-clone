/*
CONTRIBUTORS:
	IronManhood
	SpeckyYT
	
DATE:
	last updated 08/09/2019 by IronManhood
	
PURPOSE:


DOCUMENTATION:


FUNCTIONS:

	
EXAMPLE:

*/



type t_Game
	map as t_Map
	pm as pacman
	gb as ghost
	gp as ghost
	gi as ghost
	gc as ghost
endtype



global game as t_Game



function CreateGame(_g ref as t_Game)
	LoadMap("map.json", _g.map)
	CreatePacMan(_g.pm, _g.map)
endfunction






function DeleteGame(_g ref as t_Game)
	Map_Delete(_g.map)
	DeletePacMan(_g.pm)
endfunction




function UpdateGame(_g ref as t_Game)
	DrawAllTiles(_g.map)
	UpdatePacman(_g.pm, _g.map)
	updateGhosts(_g.gb, _g.gp, _g.gi, _g.gc)
endfunction

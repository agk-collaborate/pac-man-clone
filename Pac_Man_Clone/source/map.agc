

/*
CONTRIBUTORS:
	IronManhood
	
DATE:
	last updated 07/18/2019 by IronManhood
	
PURPOSE:
	The map.

DOCUMENTATION:
	

FUNCTIONS:
	
	
EXAMPLE:

*/


#constant CELLTYPE_WALL	0
#constant CELLTYPE_PATH	1


type t_Cell_Location
	ix as integer
	iy as integer
endtype


type t_Cell
	cellType as integer
	pos as t_Vector_2
	size as t_Vector_2
endtype



type t_Map
	originPos as t_Vector_2
	
	cells as t_Cell[0,0]
	
	width as integer
	height as integer
	
	
	gridSize as float
	
	created as integer
endtype



global map as t_Map



function Map_Generate(_seed, _w, _h, _gridSize#)
	if map.created = FALSE
		map.created = TRUE

		SetRandomSeed(_seed)
		
		map.width = _w
		map.height = _h
		
		map.gridSize = _gridSize#
		
		map.originPos.x = resx(0.5) - ((_gridSize# * _w) * 0.5)
		map.originPos.y = resy(0.5) - ((_gridSize# * _h) * 0.5)
		
		// Resize the array.
		map.cells.length = map.height
		for i = 0 to map.cells.length - 1
			map.cells[i].length = map.width
		next i
		
		// Create each cell.
		for i = 0 to map.cells.length - 1
			for j = 0 to map.cells[i].length - 1
				map.cells[i,j].cellType = CELLTYPE_WALL
				map.cells[i,j].size = vec2(map.gridSize, map.gridSize)
				map.cells[i,j].pos.x = (j * map.cells[i,j].size.x) + map.originPos.x
				map.cells[i,j].pos.y = (i * map.cells[i,j].size.y) + map.originPos.y
			next j
		next i
		
		// Get random cell.
		curr as t_Cell_Location
		prev as t_Cell_Location
		curr.ix = Random(0, map.width - 1)
		curr.iy = Random(0, map.height - 1)
		map.cells[curr.iy,curr.ix].cellType = CELLTYPE_PATH
		
		bornTime# = Timer()
		
		do
			if Timer() - bornTime# > 0.01
				bornTime# = Timer()
				
				for i = 0 to 1
					RandomCellMove(curr, prev)
					
					map.cells[curr.iy,curr.ix].cellType = CELLTYPE_PATH
				next i
			endif
			
			DrawAllCells()
			
			Print("Press LMB to stop.")
			PrintCellLoc(curr, "curr")
			PrintCellLoc(prev, "prev")
			
			sync()
			
			if GetPointerPressed() then exit
		loop
		
	endif
endfunction



// Choose a random direction.
function RandomCellMove(_current ref as t_Cell_Location, _previous ref as t_Cell_Location)
	_previous = _current
	select Random(0,3)
		case 0: // Up
			dec _current.iy
			if _current.iy < 0 then inc _current.iy, 4
		endcase
		
		case 1: // Down
			inc _current.iy
			if _current.iy > map.height - 1 then dec _current.iy, 4
		endcase
		
		case 2: // Left
			dec _current.ix
			if _current.ix < 0 then inc _current.ix, 4
		endcase
		
		case 3: // Right
			inc _current.ix
			if _current.ix > map.width - 1 then dec _current.ix, 4
		endcase
	endselect
endfunction


function PrintCellLoc(_cl as t_Cell_Location, _name$)
	printC(_name$) : printC(": [") : printC(_cl.ix) : PrintC(", ") : PrintC(_cl.ix) : Print("]")
endfunction


function Map_Delete()
	for i = 0 to map.cells.length - 1
		map.cells[i].length = 0
	next i
	map.cells.length = 0
	
	map.width = 0
	map.height = 0
	
	map.gridSize = 0.0
	
	map.originPos = vec2(0.0, 0.0)
	
	map.created = FALSE
endfunction






function DrawAllCells()
	if map.created
		for i = 0 to map.cells.length - 1
			for j = 0 to map.cells[i].length - 1
				select map.cells[i,j].cellType
					case CELLTYPE_WALL:
						DrawRange(map.cells[i,j].pos, map.cells[i,j].size, clr_blue, clr_blue, clr_blue, clr_blue, TRUE)
						DrawRange(map.cells[i,j].pos, map.cells[i,j].size, clr_white, clr_white, clr_white, clr_white, FALSE)
					endcase
					case CELLTYPE_PATH:
						DrawRange(map.cells[i,j].pos, map.cells[i,j].size, clr_red, clr_red, clr_red, clr_red, TRUE)
					endcase
				endselect
			next j
		next i
	endif
endfunction





function PrintAllCells()
	if map.created
		for i = 0 to map.cells.length - 1
			for j = 0 to map.cells[i].length - 1
				printC(map.cells[i,j].cellType)
				if j < map.cells[i].length - 1 then PrintC("    ")
			next j
			print("")
		next i
	endif
endfunction













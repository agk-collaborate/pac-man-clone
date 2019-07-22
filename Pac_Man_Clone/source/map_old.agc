

/*
CONTRIBUTORS:
	IronManhood
	
DATE:
	last updated 07/21/2019 by IronManhood
	
PURPOSE:
	A procedurally generated maze map.

DOCUMENTATION:
	

FUNCTIONS:
	void <-- Map_Generate(_seed, _w, _h, _gridSize#)
	
	void <-- Map_Delete()
	
	void <-- MapCellRecursion(_h, _v)
	
	integer[] <-- generateRandomDirections()
	
	void <-- DrawAllCells()
	
	void <-- PrintAllCells()
	
EXAMPLE:

*/


#constant CELLTYPE_WALL		0 // For blocking movement.
#constant CELLTYPE_PATH		1 // For movement.
#constant CELLTYPE_SPAWN		2 // For ghost block path.
#constant CELLTYPE_WHITEWALL	3 // For ghost block wall.



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
	
	sparsity as float
	
	gridSize as float
	
	created as integer
endtype



global map as t_Map
global seed as integer = 1


function Map_Generate_Random(_scalar#, _sparsity#)
	_w = Random(16, 128)
	_h = abs(_w * 0.5625)
	_s# = resy(_scalar#) / _h
	Map_Generate(seed, _w, _h, _s#, FALSE, _sparsity#)
endfunction


function Map_Generate(_seed, _w, _h, _gridSize#, _symmetrical, _sparsity#)
	if map.created = FALSE
		map.created = TRUE

		SetRandomSeed(_seed)
		
		map.width = _w
		map.height = _h
		
		map.gridSize = _gridSize#
		
		map.originPos.x = resx(0.5) - ((_gridSize# * _w) * 0.5)
		map.originPos.y = resy(0.5) - ((_gridSize# * _h) * 0.5)
		
		_qw = map.width / 2
		_qh = map.height / 2
		
		map.sparsity = clamp_f(_sparsity#, 0.0, 1.0)
		
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
		
		
		// Generate rough maze.
		MapCellRecursion(Random(0, map.width - 1), Random(0, map.height - 1), CELLTYPE_PATH)
		
		RemoveDeadEnds(_qw, _qh)
		
		
		// Cut walls. Start at 1 to avoid the border walls.
		for i = 1 to map.cells.length - 2
			for j = 1 to map.cells[i].length - 2
				if inrange_i(Random(0, 100), abs(50.0 - (50.0 * map.sparsity)), abs(50.0 + (50.0 * map.sparsity)))
					if map.cells[i,j].cellType = CELLTYPE_WALL
						map.cells[i,j].cellType = CELLTYPE_PATH
						DrawAllCells()
						sync()
					endif
				endif
			next j
		next i
		
		
		
		// Check for cavities.
		for i = 0 to map.cells.length - 1
			for j = 0 to map.cells[i].length - 1
				if IsIsland(i, j)
					map.cells[i,j].cellType = CELLTYPE_WALL
					DrawAllCells()
					sync()
				endif
			next j
		next i
		
		
		
		// Make symmetrical.
		if _symmetrical
			
			// Copy top left quadrant to top right quadrant.
			for i = 0 to _qh
				for j = map.cells[i].length - 1 to _qw step -1
					_l = (map.cells[i].length - 1) - j
					map.cells[i,j].cellType = map.cells[i,_l].cellType
				next j
				DrawAllCells()
				sync()
			next i
			
			// Copy top half to bottom half.
			for i = map.cells.length - 1 to _qh + 1 step -1
				_l = (map.cells.length - 1) - i
				for j = 0 to map.cells[i].length - 1
					map.cells[i,j].cellType = map.cells[_l,j].cellType
				next j
				DrawAllCells()
				sync()
			next i
		endif
		
		
		
		// Add Ghost Box.
		_gbsX = 3
		_gbsY = 2
		
		_tl = _qh - _gbsY
		_tr = _qh + _gbsY
		_bl = _qw - _gbsX
		_br = _qw + _gbsX
		
		for i = _tl to _tr
			for j = _bl to _br
				if i = _tl and j = _qw
					map.cells[i,j].cellType = CELLTYPE_SPAWN
					
				elseif i = _tl or i = _tr or j = _bl or j = _br
					map.cells[i,j].cellType = CELLTYPE_WHITEWALL
					
				else
					map.cells[i,j].cellType = CELLTYPE_SPAWN
				endif
				DrawAllCells()
				sync()
			next j
		next i
	endif
endfunction


 
// Check if cell is surrounded by paths.
function IsIsland(_i, _j)
	if _i - 1 < 0 then exitfunction FALSE
	if _j - 1 < 0 then exitfunction FALSE
	
	if _i + 1 > map.height then exitfunction FALSE
	if _j + 1 > map.width then exitfunction FALSE
	
	if map.cells[_i,_j].cellType = CELLTYPE_WALL then exitfunction FALSE // Current
	if map.cells[_i - 1,_j - 1].cellType = CELLTYPE_WALL then exitfunction FALSE // Top Left
	if map.cells[_i - 1,_j].cellType = CELLTYPE_WALL then exitfunction FALSE // Top
	if map.cells[_i - 1,_j + 1].cellType = CELLTYPE_WALL then exitfunction FALSE // Top Right
	if map.cells[_i,_j + 1].cellType = CELLTYPE_WALL then exitfunction FALSE // Right
	if map.cells[_i + 1,_j + 1].cellType = CELLTYPE_WALL then exitfunction FALSE // Bottom Right
	if map.cells[_i + 1,_j].cellType = CELLTYPE_WALL then exitfunction FALSE // Bottom
	if map.cells[_i + 1,_j - 1].cellType = CELLTYPE_WALL then exitfunction FALSE // Bottom Left
	if map.cells[_i,_j - 1].cellType = CELLTYPE_WALL then exitfunction FALSE // Left
endfunction TRUE


// Completely reset all map data.
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



// Recursively step through the map.cells array to generate a maze.
function MapCellRecursion(_h, _v, _cellType)
	randos as integer[]
	randos = generateRandomDirections()
	
	for i = 0 to randos.length - 1
		select randos[i]
			case 1: // Up
				if _v - 2 < 0 then continue
				if not map.cells[_v - 2,_h].cellType = _cellType
					map.cells[_v - 2,_h].cellType = _cellType
					map.cells[_v - 1,_h].cellType = _cellType
					DrawAllCells()
					sync()
//~					sleep(20)
					MapCellRecursion(_h, _v - 2, _cellType)
				endif
			endcase
			
			case 2: // Right
				if _h + 2 >= map.width - 1 then continue
				if not map.cells[_v,_h + 2].cellType = _cellType
					map.cells[_v,_h + 2].cellType = _cellType
					map.cells[_v,_h + 1].cellType = _cellType
					DrawAllCells()
					sync()
//~					sleep(20)
					MapCellRecursion(_h + 2, _v, _cellType)
				endif
			endcase
			
			case 3: // Down
				if _v + 2 >= map.height - 1 then continue
				if not map.cells[_v + 2,_h].cellType = _cellType
					map.cells[_v + 2,_h].cellType = _cellType
					map.cells[_v + 1,_h].cellType = _cellType
					DrawAllCells()
					sync()
//~					sleep(20)
					MapCellRecursion(_h, _v + 2, _cellType)
				endif
			endcase
			
			case 4: // Left
				if _h - 2 <= 0 then continue
				if not map.cells[_v, _h - 2].cellType = _cellType
					map.cells[_v, _h - 2].cellType = _cellType
					map.cells[_v, _h - 1].cellType = _cellType
					DrawAllCells()
					sync()
//~					sleep(20)
					MapCellRecursion(_h - 2, _v, _cellType)
				endif
			endcase
		endselect
	next i
endfunction


function RemoveDeadEnds(_h, _v)
		for i = 0 to map.cells.length - 1
			for j = 0 to map.cells[i].length - 1

			next j
		next i
endfunction



function getAdjacentPaths(_h, _v)
	_arr as integer[0,0]
	
endfunction


// Returns a shuffled integer array.
function generateRandomDirections()
	_arr as integer[]
	for i = 1 to 5
		_arr.insert(i)
	next i
	shuffleIntArray(_arr)
endfunction _arr




// A temporary function for representing cells.
// Simply draws a box for each cell.
function DrawAllCells()
	if map.created
		for i = 0 to map.cells.length - 1
			for j = 0 to map.cells[i].length - 1
				select map.cells[i,j].cellType
					case CELLTYPE_WALL:
						DrawRange(map.cells[i,j].pos, map.cells[i,j].size, clr_lightblue, clr_lightblue, clr_lightblue, clr_lightblue, TRUE)
						DrawRange(map.cells[i,j].pos, map.cells[i,j].size, clr_violet, clr_violet, clr_violet, clr_violet, FALSE)
					endcase
					case CELLTYPE_PATH:
						DrawRange(map.cells[i,j].pos, map.cells[i,j].size, clr_darkgrey, clr_darkgrey, clr_darkgrey, clr_darkgrey, TRUE)
					endcase
					case CELLTYPE_SPAWN:
						DrawRange(map.cells[i,j].pos, map.cells[i,j].size, clr_white, clr_white, clr_white, clr_white, TRUE)
					endcase
					case CELLTYPE_WHITEWALL:
						DrawRange(map.cells[i,j].pos, map.cells[i,j].size, clr_lightgrey, clr_lightgrey, clr_lightgrey, clr_lightgrey, TRUE)
					endcase
				endselect
			next j
		next i
	endif
endfunction


// Prints the cells in map formation.
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









/*
			// this goes in the game loop.
			Print("Press left/right arrow keys to change the seed and generate a new maze.")
			Print("Press up arrow key to randomly generate a new maze from the current seed.")
			Print("Press down arrow key to generate a symmetrical map.")
			Print("Hold equal/hyphen keys to inc/dec sparsity variable.")
			PrintC("seed: ") : Print(seed)
			PrintC("sparsity: ") : Print(sparsity)
			
			if KEY_EQUAL_STATE
				inc sparsity, 0.1 * GetFrameTime()
				sparsity = clamp_f(sparsity, 0.0, 1.0)
				
				if mazetype = 1
					Map_Delete()
					Map_Generate(seed, 40, 32, resx(0.0125), FALSE, sparsity)
				elseif mazetype = 2
					_w = map.width
					_h = map.height
					_gs# = map.gridSize
					Map_Delete()
					Map_Generate(seed, _w, _h, _gs#, FALSE, sparsity)
				elseif mazetype = 3
					Map_Delete()
					Map_Generate(seed, 40, 32, resx(0.0125), TRUE, sparsity)
				endif
				
			elseif KEY_HYPHEN_STATE
				dec sparsity, 0.1 * GetFrameTime()
				sparsity = clamp_f(sparsity, 0.0, 1.0)
				
				if mazetype = 1
					Map_Delete()
					Map_Generate(seed, 40, 32, resx(0.0125), FALSE, sparsity)
				elseif mazetype = 2
					_w = map.width
					_h = map.height
					_gs# = map.gridSize
					Map_Delete()
					Map_Generate(seed, _w, _h, _gs#, FALSE, sparsity)
				elseif mazetype = 3
					Map_Delete()
					Map_Generate(seed, 40, 32, resx(0.0125), TRUE, sparsity)
				endif
			endif
			
			if KEY_LEFT_PRESSED
				dec seed
				if seed < 1 then seed = 1
				Map_Delete()
				Map_Generate(seed, 40, 32, resx(0.0125), FALSE, sparsity)
				mazetype = 1
				
			elseif KEY_RIGHT_PRESSED
				inc seed
				Map_Delete()
				Map_Generate(seed, 40, 32, resx(0.0125), FALSE, sparsity)
				mazetype = 1
				
			elseif KEY_UP_PRESSED
				Map_Delete()
				Map_Generate_Random(0.6, sparsity)
				mazetype = 2
				
			elseif KEY_DOWN_PRESSED
				Map_Delete()
				Map_Generate(seed, 40, 32, resx(0.0125), TRUE, sparsity)
				mazetype = 3
			endif
			
			
			DrawAllCells()
*/
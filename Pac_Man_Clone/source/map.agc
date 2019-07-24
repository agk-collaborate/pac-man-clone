
/*
AUTHOR:
	IronManhood
	
DATE:
	last updated 07-22-2019
	
PURPOSE:
	A procedurally generated pac man map.

DOCUMENTATION:
	

FUNCTIONS:
	
	
EXAMPLE:
	
*/




type t_Cell
	fuck
endtype




type t_Tile
	fuck
endtype




type t_Map
	fuck
endtype





/*

//Generates a defined Pac-Man map
function defineMap()
	temp as integer
    // From forum thread: https://forum.thegamecreators.com/thread/212096
    
    mazeFile = openToRead("map.csv")
    // Set first index of array to zero, this is available to use, but is not being used.
    y = 0
    repeat
		line$ = readline(mazeFile) // Read a line from file
		numParts = countStringTokens(line$ , ";" ) // Count number of csv parameters in line
		if numParts > 0 // If more than none - ie not a blank line
			inc y // Increase y index
			for x = 1 to numParts // Loop through parameters on this line, using x array index
			temp = val(getstringToken(line$ , ";" , x)) // find type
			if temp = 0
				map.cells[x,y].cellType = CELLTYPE_WALL
			elseif temp = 1
				map.cells[x,y].cellType = CELLTYPE_PATH
			elseif temp = 2
				map.cells[x,y].cellType = CELLTYPE_WALL
			elseif temp = 3
				map.cells[x,y].cellType = CELLTYPE_SPAWN
			elseif temp = 4
				map.cells[x,y].cellType = CELLTYPE_PATH
			elseif temp = 5
				map.cells[x,y].cellType = CELLTYPE_WHITEWALL
			endif
			map.cells[x , y].cellType = val(getstringToken(line$ , ";" , x)) // populate array
			next x
		endif
    until fileeof(mazeFile) > 0 // Until the end of the file
    closefile(mazeFile) // y will now contain the number of lines read.
endfunction
*/
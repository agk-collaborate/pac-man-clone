
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

#constant TILETYPE_NULL		0 // No tile. Just black.
#constant TILETYPE_WALL		1 // For blocking movement.
#constant TILETYPE_PATH		2 // For movement.
#constant TILETYPE_SPAWN		3 // For ghost block path. This allows ghost to move freely but not the player.
#constant TILETYPE_WHITEWALL	4 // For ghost block wall.
#constant TILETYPE_EXITPATH	5 // For exit path.
#constant TILETYPE_NODOTPATH	6 // For paths with no dots.


type t_Cell
	fuck
endtype


type t_Dot
	created as integer
	active as integer
	
	size as float
	
	pos as t_Vector_2
endtype



type t_Tile
	tileType as integer
	
	pos as t_Vector_2
	size as t_Vector_2
	
	dot as t_Dot
endtype


// A type for storing bare minimun of map data.
// To shrink the file size and speed loading.
type t_Map_JSON
	width as integer
	height as integer
	tileType as integer[-1,-1]
endtype



type t_Map
	created as integer
	
	width as integer
	height as integer
	
	gridSize as float
	
	originPos as t_Vector_2
	
	tiles as t_Tile[-1,-1]
endtype


global map as t_Map




function Map_Delete()
	for i = 0 to map.tiles.length - 1
		map.tiles[i].length = -1
	next i
	map.tiles.length = -1
	
	map.width = 0
	map.height = 0
	
	map.gridSize = 0.0
	
	map.originPos = vec2(0.0, 0.0)
	map.created = FALSE
endfunction


function SaveMap(_fileName$)
	if map.created = FALSE then exitfunction
	
	_jmap as t_Map_JSON
	
	_jmap.width = map.width
	_jmap.height = map.height
	
	_jmap.tileType.length = map.tiles.length
	
	for i = 0 to _jmap.tileType.length - 1
		_jmap.tileType[i].length = map.tiles[i].length
	next i
	
	for i = 0 to map.tiles.length - 1
		for j = 0 to map.tiles[i].length - 1
			_jmap.tileType[i,j] = map.tiles[i,j].tileType
		next j
	next i
	
	_ts$ = _jmap.toJson()
	f = OpenToWrite(_fileName$)
		WriteString(f, _ts$)
	CloseFile(f)
endfunction


// Loads a map from file.
function LoadMap(_mapFile$)
	if GetFileExists(_mapFile$) = 0 or map.created = TRUE then exitfunction
	
	_fileType$ = GetStringToken2(_mapFile$, ".", CountStringTokens2(_mapFile$, "."))
	
	select _fileType$
		case "csv":
			f = OpenToRead(_mapFile$)
			while FileEOF(f) = FALSE
				_line$ = ReadLine(f)
				map.tiles.length = map.tiles.length + 1
				map.tiles[map.tiles.length].length = CountStringTokens2(_line$, ";")
				for i = 0 to map.tiles[map.tiles.length].length - 1
					map.tiles[map.tiles.length,i].tileType = val(GetStringToken2(_line$, ";", i + 1))
				next i
			endwhile
			CloseFile(f)
			
			map.created = TRUE
			
			map.height = map.tiles.length
			map.width = map.tiles[0].length
			
			map.gridSize = resy(0.8) / map.width
			
			map.originPos.x = resx(0.5) - ((map.gridSize * map.width) * 0.5)
			map.originPos.y = resy(0.5) - ((map.gridSize * map.height) * 0.5)
			
			for i = 0 to map.tiles.length - 1
				for j = 0 to map.tiles[i].length - 1
					map.tiles[i,j].size = vec2(map.gridSize, map.gridSize)
					map.tiles[i,j].pos.x = (j * map.tiles[i,j].size.x) + map.originPos.x
					map.tiles[i,j].pos.y = (i * map.tiles[i,j].size.y) + map.originPos.y
					if map.tiles[i,j].tileType = TILETYPE_PATH
						map.tiles[i,j].dot.created = TRUE
						map.tiles[i,j].dot.active = TRUE
						map.tiles[i,j].dot.size = map.gridSize * 0.125
						map.tiles[i,j].dot.pos = vec2_Add(map.tiles[i,j].pos, vec2_DivNum1(map.tiles[i,j].size, 2.0))
					endif
				next j
			next i
		endcase
		
		case "json":
			_temp$ = ""
			f = OpenToRead(_mapFile$)
			while FileEOF(f) = FALSE
				_temp$ = _temp$ + ReadLine(f)
			endwhile
			CloseFile(f)
			
			
			_jmap as t_Map_JSON
			_jmap.fromJson(_temp$)
			
			
			map.created = TRUE
			
			map.width = _jmap.width
			map.height = _jmap.height
			
			map.gridSize = resy(0.8) / map.width
			
			map.originPos.x = resx(0.5) - ((map.gridSize * map.width) * 0.5)
			map.originPos.y = resy(0.5) - ((map.gridSize * map.height) * 0.5)
			
			map.tiles.length = map.height
			for i = 0 to map.tiles.length - 1
				map.tiles[i].length = map.width
			next i
			
			for i = 0 to map.tiles.length - 1
				for j = 0 to map.tiles[i].length - 1
					map.tiles[i,j].tileType = _jmap.tileType[i,j]
					map.tiles[i,j].size = vec2(map.gridSize, map.gridSize)
					map.tiles[i,j].pos.x = (j * map.tiles[i,j].size.x) + map.originPos.x
					map.tiles[i,j].pos.y = (i * map.tiles[i,j].size.y) + map.originPos.y
					if map.tiles[i,j].tileType = TILETYPE_PATH
						map.tiles[i,j].dot.created = TRUE
						map.tiles[i,j].dot.active = TRUE
						map.tiles[i,j].dot.size = map.gridSize * 0.125
						map.tiles[i,j].dot.pos = vec2_Add(map.tiles[i,j].pos, vec2_DivNum1(map.tiles[i,j].size, 2.0))
					endif
				next j
			next i
		endcase
		
		case default:
			exitfunction
		endcase
	endselect
	
//~	SaveMap("newmap.json")
	
	/*
	// Save the map to json.
	_temp$ = map.toJson()
	f = OpenToWrite("maptype.json")
	WriteString(f, _temp$)
	CloseFile(f)
	*/
	
	
	
	/*
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
				map.tiles[x,y].tileType = TILETYPE_WALL
			elseif temp = 1
				map.tiles[x,y].tileType = TILETYPE_PATH
			elseif temp = 2
				map.tiles[x,y].tileType = TILETYPE_WALL
			elseif temp = 3
				map.tiles[x,y].tileType = TILETYPE_SPAWN
			elseif temp = 4
				map.tiles[x,y].tileType = TILETYPE_PATH
			elseif temp = 5
				map.tiles[x,y].tileType = TILETYPE_WHITEWALL
			endif
			map.tiles[x , y].tileType = val(getstringToken(line$ , ";" , x)) // populate array
			next x
		endif
    until fileeof(mazeFile) > 0 // Until the end of the file
    closefile(mazeFile) // y will now contain the number of lines read.
    */
endfunction








// A temporary function for representing tiles.
// Simply draws a box for each cell.
function DrawAllTiles()
	if map.created
		for i = 0 to map.tiles.length - 1
			for j = 0 to map.tiles[i].length - 1
				select map.tiles[i,j].tileType
					case TILETYPE_WALL:
						DrawRange(map.tiles[i,j].pos, map.tiles[i,j].size, clr_lightblue, clr_lightblue, clr_lightblue, clr_lightblue, TRUE)
						DrawRange(map.tiles[i,j].pos, map.tiles[i,j].size, clr_violet, clr_violet, clr_violet, clr_violet, FALSE)
					endcase
					case TILETYPE_PATH:
						DrawRange(map.tiles[i,j].pos, map.tiles[i,j].size, clr_darkgrey, clr_darkgrey, clr_darkgrey, clr_darkgrey, TRUE)
						if map.tiles[i,j].dot.created and map.tiles[i,j].dot.active
							vec2_DrawEllipse(map.tiles[i,j].dot.pos, vec2_1(map.tiles[i,j].dot.size), clr_tan, clr_tan, TRUE)
						endif
					endcase
					case TILETYPE_SPAWN:
						DrawRange(map.tiles[i,j].pos, map.tiles[i,j].size, clr_white, clr_white, clr_white, clr_white, TRUE)
					endcase
					case TILETYPE_WHITEWALL:
						DrawRange(map.tiles[i,j].pos, map.tiles[i,j].size, clr_lightgrey, clr_lightgrey, clr_lightgrey, clr_lightgrey, TRUE)
					endcase
					case TILETYPE_EXITPATH:
						DrawRange(map.tiles[i,j].pos, map.tiles[i,j].size, clr_darkgrey, clr_darkgrey, clr_darkgrey, clr_darkgrey, TRUE)
					endcase
					case TILETYPE_NODOTPATH:
						DrawRange(map.tiles[i,j].pos, map.tiles[i,j].size, clr_darkgrey, clr_darkgrey, clr_darkgrey, clr_darkgrey, TRUE)
					endcase
				endselect
			next j
		next i
	endif
endfunction

// Prints the tiles in map formation.
function PrintAllTiles()
	Print_Boolean("Map Created: ", map.created, "")
	if map.created
		PrintC("V len: ") : Print(map.tiles.length)
		for i = 0 to map.tiles.length - 1
			PrintC(i) : PrintC(") h len: ") : Print(map.tiles[i].length)
			for j = 0 to map.tiles[i].length - 1
				printC(map.tiles[i,j].tileType)
				if j < map.tiles[i].length - 1 then PrintC("    ")
			next j
			print("")
		next i
	endif
endfunction





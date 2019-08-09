/*
AUTHOR:
	IronManhood
	
DATE:
	last updated 07-26-2019
	
PURPOSE:
	A procedurally generated pac man map.

DOCUMENTATION:	

FUNCTIONS:
	
EXAMPLE:
	
*/

#constant TILETYPE_NULL			0 // No tile. Just black.
#constant TILETYPE_WALL			1 // For blocking movement.
#constant TILETYPE_PATH			2 // For movement.
#constant TILETYPE_SPAWN			3 // For ghost block path. This allows ghost to move freely but not the player.
#constant TILETYPE_WHITEWALL		4 // For ghost block wall.
#constant TILETYPE_EXITPATH		5 // For exit path.
#constant TILETYPE_NODOTPATH		6 // For paths with no dots.
#constant TILETYPE_PLAYERSPAWN	7 // For player spawn.

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

//~global map as t_Map

function Map_Delete(_map ref as t_Map)
	for i = 0 to _map.tiles.length - 1
		_map.tiles[i].length = -1
	next i
	_map.tiles.length = -1
	
	_map.width = 0
	_map.height = 0
	
	_map.gridSize = 0.0
	
	_map.originPos = vec2(0.0, 0.0)
	_map.created = FALSE
endfunction

function SaveMap(_fileName$, _map as t_Map)
	if _map.created = FALSE then exitfunction
	
	_fileType$ = GetStringToken2(_fileName$, ".", CountStringTokens2(_fileName$, "."))
	
	select _fileType$
		case "csv":
			f = OpenToWrite("raw:" + mediaDirectory + "/" + _fileName$)
			
			for i = 0 to _map.tiles.length - 1
				_line$ = ""
				for j = 0 to _map.tiles[i].length - 1
					if j = _map.tiles[i].length - 1
						_line$ = _line$ + str(_map.tiles[i,j].tileType)
					else
						_line$ = _line$ + str(_map.tiles[i,j].tileType) + ";"
					endif
				next j
				WriteLine(f, _line$)
			next i
			
			CloseFile(f)
		endcase
		
		case "json":
			_jmap as t_Map_JSON
			
			_jmap.width = _map.width
			_jmap.height = _map.height
			
			_jmap.tileType.length = _map.tiles.length
			
			for i = 0 to _jmap.tileType.length - 1
				_jmap.tileType[i].length = _map.tiles[i].length
			next i
			
			for i = 0 to _map.tiles.length - 1
				for j = 0 to _map.tiles[i].length - 1
					_jmap.tileType[i,j] = _map.tiles[i,j].tileType
				next j
			next i
			
			_ts$ = _jmap.toJson()
			f = OpenToWrite("raw:" + mediaDirectory + "/" + _fileName$)
				WriteString(f, _ts$)
			CloseFile(f)
		endcase
	endselect
endfunction

// Loads a map from file.
function LoadMap(_mapFile$, _map ref as t_Map)
	if GetFileExists(_mapFile$) = 0 or _map.created = TRUE then exitfunction
	
	_fileType$ = GetStringToken2(_mapFile$, ".", CountStringTokens2(_mapFile$, "."))
	
	select _fileType$
		case "csv":
			f = OpenToRead(_mapFile$)
			while FileEOF(f) = FALSE
				_line$ = ReadLine(f)
				_map.tiles.length = _map.tiles.length + 1
				_map.tiles[_map.tiles.length].length = CountStringTokens2(_line$, ";")
				for i = 0 to _map.tiles[_map.tiles.length].length - 1
					_map.tiles[_map.tiles.length,i].tileType = val(GetStringToken2(_line$, ";", i + 1))
				next i
			endwhile
			CloseFile(f)
			
			_map.created = TRUE
			
			_map.height = _map.tiles.length
			_map.width = _map.tiles[0].length
			
			_map.gridSize = resy(0.8) / _map.width
			
			_map.originPos.x = resx(0.5) - ((_map.gridSize * _map.width) * 0.5)
			_map.originPos.y = resy(0.5) - ((_map.gridSize * _map.height) * 0.5)
			
			for i = 0 to _map.tiles.length - 1
				for j = 0 to _map.tiles[i].length - 1
					_map.tiles[i,j].size = vec2(_map.gridSize, _map.gridSize)
					_map.tiles[i,j].pos.x = (j * _map.tiles[i,j].size.x) + _map.originPos.x
					_map.tiles[i,j].pos.y = (i * _map.tiles[i,j].size.y) + _map.originPos.y
					if _map.tiles[i,j].tileType = TILETYPE_PATH
						_map.tiles[i,j].dot.created = TRUE
						_map.tiles[i,j].dot.active = TRUE
						_map.tiles[i,j].dot.size = _map.gridSize * 0.125
						_map.tiles[i,j].dot.pos = vec2_Add(_map.tiles[i,j].pos, vec2_DivNum1(_map.tiles[i,j].size, 2.0))
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
			
			
			_map.created = TRUE
			
			_map.width = _jmap.width
			_map.height = _jmap.height
			
			_map.gridSize = resy(0.8) / _map.width
			
			_map.originPos.x = resx(0.5) - ((_map.gridSize * _map.width) * 0.5)
			_map.originPos.y = resy(0.5) - ((_map.gridSize * _map.height) * 0.5)
			
			_map.tiles.length = _map.height
			for i = 0 to _map.tiles.length - 1
				_map.tiles[i].length = _map.width
			next i
			
			for i = 0 to _map.tiles.length - 1
				for j = 0 to _map.tiles[i].length - 1
					_map.tiles[i,j].tileType = _jmap.tileType[i,j]
					_map.tiles[i,j].size = vec2(_map.gridSize, _map.gridSize)
					_map.tiles[i,j].pos.x = (j * _map.tiles[i,j].size.x) + _map.originPos.x
					_map.tiles[i,j].pos.y = (i * _map.tiles[i,j].size.y) + _map.originPos.y
					if _map.tiles[i,j].tileType = TILETYPE_PATH
						_map.tiles[i,j].dot.created = TRUE
						_map.tiles[i,j].dot.active = TRUE
						_map.tiles[i,j].dot.size = _map.gridSize * 0.125
						_map.tiles[i,j].dot.pos = vec2_Add(_map.tiles[i,j].pos, vec2_DivNum1(_map.tiles[i,j].size, 2.0))
					endif
				next j
			next i
		endcase
		
		case default:
			exitfunction
		endcase
	endselect
endfunction

// A temporary function for representing tiles.
// Simply draws a box for each cell.
function DrawAllTiles(_map as t_Map)
	if _map.created
		for i = 0 to _map.tiles.length - 1
			for j = 0 to _map.tiles[i].length - 1
				select _map.tiles[i,j].tileType
					case TILETYPE_WALL:
						DrawRange(_map.tiles[i,j].pos, _map.tiles[i,j].size, clr_dodger_blue, clr_dodger_blue, clr_dodger_blue, clr_dodger_blue, TRUE)
						DrawRange(_map.tiles[i,j].pos, _map.tiles[i,j].size, clr_plum, clr_plum, clr_plum, clr_plum, FALSE)
					endcase
					case TILETYPE_PATH:
						DrawRange(_map.tiles[i,j].pos, _map.tiles[i,j].size, clr_dark_grey, clr_dark_grey, clr_dark_grey, clr_dark_grey, TRUE)
						if _map.tiles[i,j].dot.created and _map.tiles[i,j].dot.active
							vec2_DrawEllipse(_map.tiles[i,j].dot.pos, vec2_1(_map.tiles[i,j].dot.size), clr_tan, clr_tan, TRUE)
						endif
					endcase
					case TILETYPE_SPAWN:
						DrawRange(_map.tiles[i,j].pos, _map.tiles[i,j].size, clr_white, clr_white, clr_white, clr_white, TRUE)
					endcase
					case TILETYPE_WHITEWALL:
						DrawRange(_map.tiles[i,j].pos, _map.tiles[i,j].size, clr_light_grey, clr_light_grey, clr_light_grey, clr_light_grey, TRUE)
					endcase
					case TILETYPE_EXITPATH:
						DrawRange(_map.tiles[i,j].pos, _map.tiles[i,j].size, clr_dark_grey, clr_dark_grey, clr_dark_grey, clr_dark_grey, TRUE)
					endcase
					case TILETYPE_NODOTPATH:
						DrawRange(_map.tiles[i,j].pos, _map.tiles[i,j].size, clr_dark_grey, clr_dark_grey, clr_dark_grey, clr_dark_grey, TRUE)
					endcase
					case TILETYPE_PLAYERSPAWN:
						DrawRange(_map.tiles[i,j].pos, _map.tiles[i,j].size, clr_dark_grey, clr_dark_grey, clr_dark_grey, clr_dark_grey, TRUE)
					endcase
				endselect
			next j
		next i
	endif
endfunction

// Returns the first encountered player spawn tile's center position.
function GetPMSpawnPosition(_map as t_Map)
	if _map.created
		_v as t_Vector_2
		for i = 0 to _map.tiles.length - 1
			for j = 0 to _map.tiles[i].length - 1
				if _map.tiles[i,j].tileType = TILETYPE_PLAYERSPAWN
					_v = GetTileCenterPos(_map, i, j)
					exitfunction _v
				endif
			next j
		next i
	endif
endfunction _v



// Returns the X index of the tile the x parameter is within.
function GetTileIndexX(_map ref as t_Map, _x#)
	_ret = clamp_i(floor((_x# - _map.originPos.x) / _map.gridSize), 0, _map.width - 1)
endfunction _ret

// Returns the Y index of the tile the y parameter is within.
function GetTileIndexY(_map ref as t_Map, _y#)
	_ret = clamp_i(floor((_y# - _map.originPos.y) / _map.gridSize), 0, _map.height - 1)
endfunction _ret



// Return the center position of the tile.
function GetTileCenterPos(_map ref as t_Map, _ix, _iy)
	_v as t_Vector_2
	_v = vec2_Add(_map.tiles[_ix,_iy].pos, vec2_MultNum1(_map.tiles[_ix,_iy].size, 0.5))
endfunction _v







// Prints the tiles in map formation.
function PrintAllTiles(_map as t_Map)
	Print_Boolean("Map Created: ", _map.created, "")
	if _map.created
		PrintC("V len: ") : Print(_map.tiles.length)
		for i = 0 to _map.tiles.length - 1
			PrintC(i) : PrintC(") h len: ") : Print(_map.tiles[i].length)
			for j = 0 to _map.tiles[i].length - 1
				printC(_map.tiles[i,j].tileType)
				if j < _map.tiles[i].length - 1 then PrintC("    ")
			next j
			print("")
		next i
	endif
endfunction

function GetTileTypeString(_type)
	select _type
		case TILETYPE_WALL:
			exitfunction "Wall"
		endcase
		case TILETYPE_PATH:
			exitfunction "Path"
		endcase
		case TILETYPE_SPAWN:
			exitfunction "Spawn"
		endcase
		case TILETYPE_WHITEWALL:
			exitfunction "White Wall"
		endcase
		case TILETYPE_EXITPATH:
			exitfunction "Exit Path"
		endcase
		case TILETYPE_NODOTPATH:
			exitfunction "No Dot Path"
		endcase
		case TILETYPE_PLAYERSPAWN:
			exitfunction "Player Spawn"
		endcase
	endselect
endfunction "Null"

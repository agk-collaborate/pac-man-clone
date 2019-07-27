
/*
CONTRIBUTORS:
	IronManhood
	
DATE:
	last updated 07/26/2019 by IronManhood
	
PURPOSE:
	

DOCUMENTATION:
	

FUNCTIONS:
	
	
EXAMPLE:

*/

type t_Editor
	created as integer
	
	currentType as integer
	fileTypeSwitch as integer
	
	map as t_Map
endtype


global editor as t_Editor





function CreateEditorUI()
	if editor.created = TRUE then exitfunction
	
	editor.created = TRUE
	
	CreateEditorMap(19, 22)
endfunction



function DeleteEditor()
	editor.created = FALSE
	editor.currentType = 0
	editor.fileTypeSwitch = 0
	
	for i = 0 to editor.map.tiles.length - 1
		editor.map.tiles[i].length = -1
	next i
	editor.map.tiles.length = -1
endfunction




function UpdateEditor()
	DrawEditorMap(editor)
	
	Print("Press Up/Down arrow keys to change tile type.")
	Print("Press Right/Left arrow keys to change file type.")
	Print("Press Ctrl + S to save the map to file.")
	Print("Press Ctrl + O to load a map.")
	Print("")
	PrintC("Tile Type: ") : Print(GetTileTypeString(editor.currentType))
	PrintC("filetype: ")
	if editor.fileTypeSwitch then Print("JSON")
	if not editor.fileTypeSwitch then Print("CSV")
	
	_xi = GetEditorGridX()
	_yi = GetEditorGridY()
	
	printc("grid index: [") : printc(_yi) : printc(", ") : printc(_xi) : print("]")
	
	// Check if cursor is tile map bounds. If not, don't allow tile changing.
	if inBounds(GetPointerX(), GetPointerY(), editor.map.originPos, vec2_MultNum1(vec2(editor.map.width, editor.map.height), editor.map.gridSize))
		DrawRange(editor.map.tiles[_yi,_xi].pos, editor.map.tiles[_yi,_xi].size, clr_yellow, clr_yellow, clr_yellow, clr_yellow, FALSE)
		if KEY_LMB_STATE
			editor.map.tiles[_yi,_xi].tileType = editor.currentType
		endif
	endif
	
	// No modifier keys pressed.
	if not KEY_CONTROL_STATE and not KEY_SHIFT_STATE
		if KEY_UP_PRESSED
			dec editor.currentType
			if editor.currentType < TILETYPE_NULL then editor.currentType = TILETYPE_PLAYERSPAWN
		elseif KEY_DOWN_PRESSED
			inc editor.currentType
			if editor.currentType > TILETYPE_PLAYERSPAWN then editor.currentType = TILETYPE_NULL
		endif
		
		if KEY_LEFT_PRESSED
			editor.fileTypeSwitch = 0
			
		elseif KEY_RIGHT_PRESSED
			editor.fileTypeSwitch = 1
		endif
	// Ctrl key pressed and not shift.
	elseif KEY_CONTROL_STATE and not KEY_SHIFT_STATE
		if KEY_S_PRESSED
			_fName$ = TextInput("Map Name", 0)
			select editor.fileTypeSwitch
				case 0:
					SaveMap(_fName$ + ".csv", editor.map)
				endcase
				case 1:
					SaveMap(_fName$ + ".json", editor.map)
				endcase
			endselect
		endif
		
		if KEY_O_PRESSED
			_file$ = ChooseRawFile("*.csv;*.json", TRUE)
			if editor.map.created then Map_Delete(editor.map)
			LoadMap("raw:" + _file$, editor.map)
		endif
	// Shift key pressed and not control.
	elseif not KEY_CONTROL_STATE and KEY_SHIFT_STATE
		if KEY_UP_PRESSED
			editor.map.tiles.remove()
			dec editor.map.height
			if editor.map.height < 0 then editor.map.height = 0
			
		elseif KEY_DOWN_PRESSED
			editor.map.tiles.length = editor.map.tiles.length + 1
			editor.map.tiles[editor.map.tiles.length - 1].length = editor.map.width
			inc editor.map.height
		endif
		
		if KEY_LEFT_PRESSED
			for i = 0 to editor.map.tiles.length - 1
				editor.map.tiles[i].remove()
			next i
			dec editor.map.width
			if editor.map.width < 0 then editor.map.width = 0
			
		elseif KEY_RIGHT_PRESSED
			for i = 0 to editor.map.tiles.length - 1
				_temp as t_Tile
				editor.map.tiles[i].insert(_temp)
			next i
			inc editor.map.width
		endif
		
		if KEY_UP_PRESSED or KEY_DOWN_PRESSED or KEY_LEFT_PRESSED or KEY_RIGHT_PRESSED then UpdateResizedEditorMap()
	endif
endfunction


// Returns the tile index X the pointer is pointing at.
function GetEditorGridX()
	_ret = clamp_i(floor((GetPointerX() - editor.map.originPos.x) / editor.map.gridSize), 0, editor.map.width - 1)
endfunction _ret

// Returns the tile index Y the pointer is pointing at.
function GetEditorGridY()
	_ret = clamp_i(floor((GetPointerY() - editor.map.originPos.y) / editor.map.gridSize), 0, editor.map.height - 1)
endfunction _ret




function CreateEditorMap(_w, _h)
	editor.map.created = TRUE
	
	editor.map.width = _w
	editor.map.height = _h
	
	editor.map.gridSize = min_f(resy(0.8) / editor.map.width, resy(0.9) / editor.map.height)
	
	editor.map.originPos.x = resx(0.5) - ((editor.map.gridSize * editor.map.width) * 0.5)
	editor.map.originPos.y = resy(0.5) - ((editor.map.gridSize * editor.map.height) * 0.5)
	
	editor.map.tiles.length = editor.map.height
	for i = 0 to editor.map.tiles.length - 1
		editor.map.tiles[i].length = editor.map.width
	next i
	
	for i = 0 to editor.map.tiles.length - 1
		for j = 0 to editor.map.tiles[i].length - 1
			editor.map.tiles[i,j].tileType = TILETYPE_NULL
			editor.map.tiles[i,j].size = vec2(editor.map.gridSize, editor.map.gridSize)
			editor.map.tiles[i,j].pos.x = (j * editor.map.tiles[i,j].size.x) + editor.map.originPos.x
			editor.map.tiles[i,j].pos.y = (i * editor.map.tiles[i,j].size.y) + editor.map.originPos.y
		next j
	next i
endfunction


function UpdateResizedEditorMap()
	if editor.map.created
		editor.map.gridSize = min_f(resy(0.8) / editor.map.width, resy(0.9) / editor.map.height)
		
		editor.map.originPos.x = resx(0.5) - ((editor.map.gridSize * editor.map.width) * 0.5)
		editor.map.originPos.y = resy(0.5) - ((editor.map.gridSize * editor.map.height) * 0.5)
		
		for i = 0 to editor.map.tiles.length - 1
			for j = 0 to editor.map.tiles[i].length - 1
				editor.map.tiles[i,j].size = vec2(editor.map.gridSize, editor.map.gridSize)
				editor.map.tiles[i,j].pos.x = (j * editor.map.tiles[i,j].size.x) + editor.map.originPos.x
				editor.map.tiles[i,j].pos.y = (i * editor.map.tiles[i,j].size.y) + editor.map.originPos.y
			next j
		next i
	endif
endfunction







function DrawEditorMap(_e as t_Editor)
	if _e.created
		for i = 0 to _e.map.tiles.length - 1
			for j = 0 to _e.map.tiles[i].length - 1
				select _e.map.tiles[i,j].tileType
					case TILETYPE_WALL:
						DrawRange(_e.map.tiles[i,j].pos, _e.map.tiles[i,j].size, clr_lightblue, clr_lightblue, clr_lightblue, clr_lightblue, TRUE)
						DrawRange(_e.map.tiles[i,j].pos, _e.map.tiles[i,j].size, clr_violet, clr_violet, clr_violet, clr_violet, FALSE)
					endcase
					case TILETYPE_PATH:
						DrawRange(_e.map.tiles[i,j].pos, _e.map.tiles[i,j].size, clr_darkgrey, clr_darkgrey, clr_darkgrey, clr_darkgrey, TRUE)
					endcase
					case TILETYPE_SPAWN:
						DrawRange(_e.map.tiles[i,j].pos, _e.map.tiles[i,j].size, clr_white, clr_white, clr_white, clr_white, TRUE)
					endcase
					case TILETYPE_WHITEWALL:
						DrawRange(_e.map.tiles[i,j].pos, _e.map.tiles[i,j].size, clr_lightgrey, clr_lightgrey, clr_lightgrey, clr_lightgrey, TRUE)
					endcase
					case TILETYPE_EXITPATH:
						DrawRange(_e.map.tiles[i,j].pos, _e.map.tiles[i,j].size, clr_darkgrey, clr_darkgrey, clr_darkgrey, clr_darkgrey, TRUE)
						vec2_DrawLine(vec2(_e.map.tiles[i,j].pos.x, _e.map.tiles[i,j].pos.y + (_e.map.tiles[i,j].size.x * 0.5)), vec2(_e.map.tiles[i,j].pos.x + _e.map.tiles[i,j].size.x, _e.map.tiles[i,j].pos.y), clr_green, clr_green)
						vec2_DrawLine(vec2(_e.map.tiles[i,j].pos.x, _e.map.tiles[i,j].pos.y + (_e.map.tiles[i,j].size.x * 0.5)), vec2_Add(_e.map.tiles[i,j].pos, _e.map.tiles[i,j].size), clr_green, clr_green)
					endcase
					case TILETYPE_NODOTPATH:
						DrawRange(_e.map.tiles[i,j].pos, _e.map.tiles[i,j].size, clr_darkgrey, clr_darkgrey, clr_darkgrey, clr_darkgrey, TRUE)
						vec2_DrawLine(_e.map.tiles[i,j].pos, vec2_Add(_e.map.tiles[i,j].pos, _e.map.tiles[i,j].size), clr_red, clr_red)
					endcase
					case TILETYPE_PLAYERSPAWN:
						DrawRange(_e.map.tiles[i,j].pos, _e.map.tiles[i,j].size, clr_darkgrey, clr_darkgrey, clr_darkgrey, clr_darkgrey, TRUE)
						_x# = _e.map.tiles[i,j].pos.x + (_e.map.tiles[i,j].size.x * 0.5)
						vec2_DrawLine(vec2(_x#, _e.map.tiles[i,j].pos.y), vec2(_x#, _e.map.tiles[i,j].pos.y + _e.map.tiles[i,j].size.y), clr_lightblue, clr_lightblue)
						_y# = _e.map.tiles[i,j].pos.y + (_e.map.tiles[i,j].size.y * 0.5)
						vec2_DrawLine(vec2(_e.map.tiles[i,j].pos.x, _y#), vec2(_e.map.tiles[i,j].pos.x + _e.map.tiles[i,j].size.x, _y#), clr_lightblue, clr_lightblue)
					endcase
					
					case default:
						DrawRange(_e.map.tiles[i,j].pos, _e.map.tiles[i,j].size, clr_white, clr_white, clr_white, clr_white, FALSE)
					endcase
				endselect
			next j
		next i
	endif
endfunction











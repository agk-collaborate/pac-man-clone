

/*
CONTRIBUTORS:
	IronManhood
	
DATE:
	last updated 07/20/2019 by IronManhood
	
PURPOSE:
	A file for random bits of code.

DOCUMENTATION:
	void <-- Print_Debug(state)
	
	void <-- void <-- Print_Debug(state)
	
	float <-- resx(_scalar#)
	float <-- resy(_scalar#)
	
	void <-- shuffleIntArray(_irr ref as integer[])

	boolean <-- inrange_i(_val, _min, _max)
	boolean <-- inrange_f(_val#, _min#, _max#)
		
	float <-- clamp_i(_val, _min, _max)
	float <-- clamp_f(_val#, _min#, _max#)
	
FUNCTIONS:
	
	
EXAMPLE:

*/



#constant TRUE	1
#constant FALSE	0








// A convenience function to help with debugging.
function Print_Debug(state)
	if state
		PrintC("FPS: ") : Print(str(ScreenFPS(), 0))
		
		
		PrintC("Vitrual Resolution: ") : Print(vec2_str(res, 0))
		
//~		PrintAllTiles()
	endif
endfunction


// Helper for printing a integer boolean.
function Print_Boolean(_prefix$, _val, _postfix$)
	PrintC(_prefix$)
	if _val
		PrintC("True")
	else
		PrintC("False")
	endif
	Print(_postfix$)
endfunction



// Returns a percentage of the resolution x axis.
// _scalar# = 0.0 to 1.0
function resx(_scalar#)
endfunction res.x * _scalar#

// Returns a percentage of the resolution y axis.
// _scalar# = 0.0 to 1.0
function resy(_scalar#)
endfunction res.y * _scalar#


// A wrapper for using vector2 with draw box.
function DrawRange(_pos as t_Vector_2, _size as t_Vector_2, _clr1, _clr2, _clr3, _clr4, _solid)
	DrawBox(_pos.x, _pos.y, _pos.x + _size.x, _pos.y + _size.y, _clr1, _clr2, _clr3, _clr4, _solid)
endfunction


// Randomly shuffles an integer array.
// The larger the array the slower this will be.
function shuffleIntArray(_irr ref as integer[])
	_i1 = 0
	_i2 = 0
	for i = 1 to _irr.length
		// Get random indices to swap.
		do
			_i1 = Random(0, _irr.length - 1)
			_i2 = Random(0, _irr.length - 1)
			if not _i1 = _i2 then exit
		loop
		_irr.swap(_i1, _i2)
	next i
endfunction



// Returns TRUE if the value is within min/max. integer
function inrange_i(_val, _min, _max)
	if _val < _min then exitfunction FALSE
	if _val > _max then exitfunction FALSE
endfunction TRUE

// Returns TRUE if the value is within min/max. float
function inrange_f(_val#, _min#, _max#)
	if _val# < _min# then exitfunction FALSE
	if _val# > _max# then exitfunction FALSE
endfunction TRUE



// Clamp a value between min/max. integer
function clamp_i(_val, _min, _max)
	if _val < _min then exitfunction _min
	if _val > _max then exitfunction _max
endfunction _val

// Clamp a value between min/max. integer
function clamp_f(_val#, _min#, _max#)
	if _val# < _min# then exitfunction _min#
	if _val# > _max# then exitfunction _max#
endfunction _val#











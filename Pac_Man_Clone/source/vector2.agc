

/*
CONTRIBUTORS:
	IronManhood
	
DATE:
	last updated 07/18/2019 by IronManhood
	
PURPOSE:
	A vector 2 library.

DOCUMENTATION:
	

FUNCTIONS:
	t_Vector_2 <-- vec2(_x#, _y#)
	
	float <-- vec2_Length(_v as t_Vector_2)
	
	float <-- vec2_Distance(_v1 as t_Vector_2, _v2 as t_Vector_2)
		
	string <-- vec2_str(_v as t_Vector_2, decimal)
	
EXAMPLE:

*/



type t_Vector_2
	x as float
	y as float
endtype




// Return a vec2.
function vec2(_x#, _y#)
	_temp as t_Vector_2
	_temp.x = _x#
	_temp.y = _y#
endfunction _temp



// Return the length of the vector2.
function vec2_Length(_v as t_Vector_2)
	_ret# = sqrt((_v.x * _v.x) + (_v.y * _v.y))
endfunction _ret#


// Return the distance between two vectors.
function vec2_Distance(_v1 as t_Vector_2, _v2 as t_Vector_2)
	_ret# = (_v2.x - _v1.x) ^ 2 + (_v2.y - _v1.y) ^ 2
endfunction _ret#




// Return a vec2 formatted as a string.
function vec2_str(_v as t_Vector_2, decimal)
	_ret$ = "[" + str(_v.x, decimal) + ", " + str(_v.y, decimal) + "]"
endfunction _ret$

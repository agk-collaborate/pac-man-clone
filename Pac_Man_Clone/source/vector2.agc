

/*
CONTRIBUTORS:
	IronManhood
	
DATE:
	last updated 07/26/2019 by IronManhood
	
PURPOSE:
	A vector 2 library.

DOCUMENTATION:
	

FUNCTIONS:
	t_Vector_2 <-- vec2(_x#, _y#)
	
	t_Vector_2 <-- vec2_Add(_v1 as t_Vector_2, _v2 as t_Vector_2)
	t_Vector_2 <-- vec2_AddNum1(_v as t_Vector_2, _num#)
	t_Vector_2 <-- vec2_AddNum2(_v as t_Vector_2, _x#, _y#)
	
	t_Vector_2 <-- vec2_Sub(_v1 as t_Vector_2, _v2 as t_Vector_2)
	t_Vector_2 <-- vec2_SubNum1(_v as t_Vector_2, _num#)
	t_Vector_2 <-- vec2_SubNum2(_v as t_Vector_2, _x#, _y#)
	
	t_Vector_2 <-- vec2_Div(_v1 as t_Vector_2, _v2 as t_Vector_2)
	t_Vector_2 <-- vec2_DivNum1(_v as t_Vector_2, _num#)
	t_Vector_2 <-- vec2_DivNum2(_v as t_Vector_2, _x#, _y#)
	
	t_Vector_2 <-- vec2_Mult(_v1 as t_Vector_2, _v2 as t_Vector_2)
	t_Vector_2 <-- vec2_MultNum1(_v as t_Vector_2, _num#)
	t_Vector_2 <-- vec2_MultNum2(_v as t_Vector_2, _x#, _y#)
	
	void <-- vec2_Inc(_v ref as t_Vector_2, _stepX#, _stepY#)
	void <-- vec2_Dec(_v ref as t_Vector_2, _stepX#, _stepY#)
	
	float <-- vec2_Length(_v as t_Vector_2)
	
	float <-- vec2_Distance(_v1 as t_Vector_2, _v2 as t_Vector_2)
	
	void <-- vec2_DrawLine(_pos as t_Vector_2, _size as t_Vector_2, _clr1, _clr2)
	void <-- vec2_DrawLineRGB(_pos as t_Vector_2, _size as t_Vector_2, _r, _g, _b)
	
	void <-- vec2_DrawEllipse(_pos as t_Vector_2, _radius as t_Vector_2, _clr1, _clr2, _filled)
	
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

// Return a vec2.
function vec2_1(_val#)
	_temp as t_Vector_2
	_temp.x = _val#
	_temp.y = _temp.x
endfunction _temp



// Return a vector equalling the addition of the parameters.
function vec2_Add(_v1 as t_Vector_2, _v2 as t_Vector_2)
	_ret as t_Vector_2
	_ret.x = _v1.x + _v2.x
	_ret.y = _v1.y + _v2.y
endfunction _ret

// Return a vector equalling the addition of the parameters.
function vec2_AddNum1(_v as t_Vector_2, _num#)
	_ret as t_Vector_2
	_ret.x = _v.x + _num#
	_ret.y = _v.y + _num#
endfunction _ret

// Return a vector equalling the addition of the parameters.
function vec2_AddNum2(_v as t_Vector_2, _x#, _y#)
	_ret as t_Vector_2
	_ret.x = _v.x + _x#
	_ret.y = _v.y + _y#
endfunction _ret




// Return a vector equalling the addition of the parameters.
function vec2_Sub(_v1 as t_Vector_2, _v2 as t_Vector_2)
	_ret as t_Vector_2
	_ret.x = _v1.x - _v2.x
	_ret.y = _v1.y - _v2.y
endfunction _ret

// Return a vector equalling the addition of the parameters.
function vec2_SubNum1(_v as t_Vector_2, _num#)
	_ret as t_Vector_2
	_ret.x = _v.x - _num#
	_ret.y = _v.y - _num#
endfunction _ret

// Return a vector equalling the addition of the parameters.
function vec2_SubNum2(_v as t_Vector_2, _x#, _y#)
	_ret as t_Vector_2
	_ret.x = _v.x - _x#
	_ret.y = _v.y - _y#
endfunction _ret



// Return a vector equalling the division of the parameters.
function vec2_Div(_v1 as t_Vector_2, _v2 as t_Vector_2)
	_ret as t_Vector_2
	_ret.x = _v1.x / _v2.x
	_ret.y = _v1.y / _v2.y
endfunction _ret

// Return a vector equalling the division of the parameters.
function vec2_DivNum1(_v as t_Vector_2, _num#)
	_ret as t_Vector_2
	_ret.x = _v.x / _num#
	_ret.y = _v.y / _num#
endfunction _ret

// Return a vector equalling the division of the parameters.
function vec2_DivNum2(_v as t_Vector_2, _x#, _y#)
	_ret as t_Vector_2
	_ret.x = _v.x / _x#
	_ret.y = _v.y / _y#
endfunction _ret



// Return a vector equalling the multiplication of the parameters.
function vec2_Mult(_v1 as t_Vector_2, _v2 as t_Vector_2)
	_ret as t_Vector_2
	_ret.x = _v1.x * _v2.x
	_ret.y = _v1.y * _v2.y
endfunction _ret

// Return a vector equalling the multiplication of the parameters.
function vec2_MultNum1(_v as t_Vector_2, _num#)
	_ret as t_Vector_2
	_ret.x = _v.x * _num#
	_ret.y = _v.y * _num#
endfunction _ret

// Return a vector equalling the multiplication of the parameters.
function vec2_MultNum2(_v as t_Vector_2, _x#, _y#)
	_ret as t_Vector_2
	_ret.x = _v.x * _x#
	_ret.y = _v.y * _y#
endfunction _ret




// Increment the vector by the step parameters.
function vec2_Inc(_v ref as t_Vector_2, _stepX#, _stepY#)
	inc _v.x, _stepX# : inc _v.y, _stepY#
endfunction

// Decrement the vector by the step parameters.
function vec2_Dec(_v ref as t_Vector_2, _stepX#, _stepY#)
	dec _v.x, _stepX# : dec _v.y, _stepY#
endfunction




// Return the length of the vector2.
function vec2_Length(_v as t_Vector_2)
	_ret# = sqrt((_v.x * _v.x) + (_v.y * _v.y))
endfunction _ret#


// Return the distance between two vectors.
function vec2_Distance(_v1 as t_Vector_2, _v2 as t_Vector_2)
	_ret# = (_v2.x - _v1.x) ^ 2 + (_v2.y - _v1.y) ^ 2
endfunction _ret#




// A wrapper for using vector2 with draw line.
function vec2_DrawLine(_pos1 as t_Vector_2, _pos2 as t_Vector_2, _clr1, _clr2)
	DrawLine(_pos1.x, _pos1.y, _pos2.x, _pos2.y, _clr2, _clr2)
endfunction

// A wrapper for using vector2 with draw line.
function vec2_DrawLineRGB(_pos1 as t_Vector_2, _pos2 as t_Vector_2, _r, _g, _b)
	DrawLine(_pos1.x, _pos1.y, _pos2.x, _pos2.y, _r, _g, _b)
endfunction


// A wrapper for using vector2 with draw ellipse.
function vec2_DrawEllipse(_pos as t_Vector_2, _radius as t_Vector_2, _clr1, _clr2, _filled)
	DrawEllipse(_pos.x, _pos.y, _radius.x, _radius.y, _clr1, _clr2, _filled)
endfunction


// Return a vec2 formatted as a string.
function vec2_str(_v as t_Vector_2, decimal)
	_ret$ = "[" + str(_v.x, decimal) + ", " + str(_v.y, decimal) + "]"
endfunction _ret$

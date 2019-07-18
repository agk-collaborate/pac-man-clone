

/*
CONTRIBUTORS:
	IronManhood
	
DATE:
	last updated 07/18/2019 by IronManhood
	
PURPOSE:
	A file for random bits of code.

DOCUMENTATION:
	void <-- Print_Debug(state)
	
	float <-- resx(_scalar#)
	float <-- resy(_scalar#)

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
		
	endif
endfunction




// Returns a percentage of the resolution x axis.
// _scalar# = 0.0 to 1.0
function resx(_scalar#)
endfunction res.x * _scalar#

// Returns a percentage of the resolution y axis.
// _scalar# = 0.0 to 1.0
function resy(_scalar#)
endfunction res.y * _scalar#
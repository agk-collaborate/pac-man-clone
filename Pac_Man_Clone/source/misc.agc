

/*
CONTRIBUTORS:
	IronManhood
	
DATE:
	last updated 07/18/2019 by IronManhood
	
PURPOSE:
	A file for random bits of code.

DOCUMENTATION:
	void <-- Print_Debug(state)

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
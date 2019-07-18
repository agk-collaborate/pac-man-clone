// Project: Pac_Man_Clone
// Created: 19-07-18


#include "source/misc.agc"
#include "source/vector2.agc"
#include "source/mainMenu.agc"
#include "source/map.agc"



global res as t_Vector_2
res.x = GetMaxDeviceWidth() : res.y = GetMaxDeviceHeight()

global SyncRate as float = 60.0
global fullscreen as integer = FALSE
global PrintSize as float = 36.0
global AppState as integer = 0



// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle("Pac_Man_Clone")
SetWindowSize(res.x * 0.5, res.y * 0.5, fullscreen)
SetWindowAllowResize(1) // allow the user to resize the window

// set display properties
SetVirtualResolution(res.x, res.y) // doesn't have to match the window
SetOrientationAllowed(1, 0, 1, 1) // allow both portrait and landscape on mobile devices
SetSyncRate(SyncRate, 1) // 30fps instead of 60 to save battery
SetScissor(0, 0, 0, 0) // use the maximum available screen space, no black borders
UseNewDefaultFonts(1)

// set print properties
SetPrintColor(255, 255, 0)
SetPrintSize(PrintSize)





MainMenu_Create()



do
	UpdateApp(AppState)
	
	Print_Debug(TRUE)
	
	Sync()
loop


// This will control what state the app is in.
// Case 0 is main menu.
// Case 1 is game.
function UpdateApp(state)
	select state
		case 0:
			MainMenu_Update()
		endcase
		case 1:
		endcase
	endselect
endfunction



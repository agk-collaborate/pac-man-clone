// Project: Pac_Man_Clone
// Created: 19-07-18


#include "source/misc.agc"
#include "source/vector2.agc"
#include "source/mainMenu.agc"
#include "source/map.agc"
#include "source/ghosts.agc"
#include "source/pac-man.agc"

#constant APPSTATE_MAINMENU	0
#constant APPSTATE_GAME		1

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

global clr_white as integer
global clr_red as integer
global clr_blue as integer
clr_white = MakeColor(255, 255, 255)
clr_red = MakeColor(255, 0, 0)
clr_blue = MakeColor(0, 0, 255)



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
		case APPSTATE_MAINMENU:
			MainMenu_Update()
			if GetRawKeyPressed(27) // Escape
				DeleteAllImages()
				DeleteAllSprites()
				DeleteAllText()
				end
			endif
		endcase
		case APPSTATE_GAME:
			Print("Press left/right arrow keys to change the seed and generate a new maze.")
			Print("Press up arrow key to randomly generate a new maze from the current seed.")
			PrintC("seed: ") : Print(seed)
			if GetRawKeyPressed(37) // Left Arrow
				dec seed
				if seed < 1 then seed = 1
				Map_Delete()
				Map_Generate(seed, 40, 32, resx(0.0125))
				
			elseif GetRawKeyPressed(39) // Right Arrow
				inc seed
				Map_Delete()
				Map_Generate(seed, 40, 32, resx(0.0125))
				
			elseif GetRawKeyPressed(38) // Up Arrow
				Map_Delete()
				Map_Generate_Random(0.6)
			endif
			
			DrawAllCells()
			
			if GetRawKeyPressed(27) // Escape
				Map_Delete()
				MainMenu_Show()
				AppState = APPSTATE_MAINMENU
			endif
		endcase
	endselect
endfunction



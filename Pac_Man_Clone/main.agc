// Project: Pac_Man_Clone
// Created: 19-07-18


#include "source/misc.agc"
#include "source/vector2.agc"
#include "source/mainMenu.agc"
#include "source/map.agc"
#include "source/ghosts.agc"
#include "source/pac-man.agc"
#include "source/keys.agc"
#include "source/temp_Map.agc"

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
global clr_lightblue as integer
global clr_lightgrey as integer
global clr_darkgrey as integer
global clr_violet as integer
clr_white = MakeColor(255, 255, 255)
clr_red = MakeColor(255, 0, 0)
clr_blue = MakeColor(0, 0, 255)
clr_lightblue = MakeColor(12, 160, 225)
clr_lightgrey = MakeColor(161, 161, 161)
clr_darkgrey = MakeColor(31, 31, 31)
clr_violet = MakeColor(225, 190, 225)



MainMenu_Create()

global sparsity as float = 0.2
global mazetype as integer = 1


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
			Print("Press down arrow key to generate a symmetrical map.")
			Print("Press B key to create a defined Pac-Man map.")
			Print("Hold equal/hyphen keys to inc/dec sparsity variable.")
			PrintC("seed: ") : Print(seed)
			PrintC("sparsity: ") : Print(sparsity)
			
			if KEY_EQUAL_STATE
				inc sparsity, 0.1 * GetFrameTime()
				sparsity = clamp_f(sparsity, 0.0, 1.0)
				
				if mazetype = 1
					Map_Delete()
					Map_Generate(seed, 40, 32, resx(0.0125), FALSE, sparsity)
				elseif mazetype = 2
					_w = map.width
					_h = map.height
					_gs# = map.gridSize
					Map_Delete()
					Map_Generate(seed, _w, _h, _gs#, FALSE, sparsity)
				elseif mazetype = 3
					Map_Delete()
					Map_Generate(seed, 40, 32, resx(0.0125), TRUE, sparsity)
				endif
				
			elseif KEY_HYPHEN_STATE
				dec sparsity, 0.1 * GetFrameTime()
				sparsity = clamp_f(sparsity, 0.0, 1.0)
				
				if mazetype = 1
					Map_Delete()
					Map_Generate(seed, 40, 32, resx(0.0125), FALSE, sparsity)
				elseif mazetype = 2
					_w = map.width
					_h = map.height
					_gs# = map.gridSize
					Map_Delete()
					Map_Generate(seed, _w, _h, _gs#, FALSE, sparsity)
				elseif mazetype = 3
					Map_Delete()
					Map_Generate(seed, 40, 32, resx(0.0125), TRUE, sparsity)
				endif
			endif
			
			if KEY_LEFT_PRESSED
				dec seed
				if seed < 1 then seed = 1
				Map_Delete()
				Map_Generate(seed, 40, 32, resx(0.0125), FALSE, sparsity)
				mazetype = 1
				
			elseif KEY_RIGHT_PRESSED
				inc seed
				Map_Delete()
				Map_Generate(seed, 40, 32, resx(0.0125), FALSE, sparsity)
				mazetype = 1
				
			elseif KEY_UP_PRESSED
				Map_Delete()
				Map_Generate_Random(0.6, sparsity)
				mazetype = 2
				
			elseif KEY_DOWN_PRESSED
				Map_Delete()
				Map_Generate(seed, 40, 32, resx(0.0125), TRUE, sparsity)
				mazetype = 3
			
			elseif KEY_B_PRESSED
				Map_Delete()
				defineMap()
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



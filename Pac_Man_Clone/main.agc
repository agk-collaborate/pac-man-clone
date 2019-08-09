// Project: Pac_Man_Clone
// Created: 19-07-18

// Initialize globals.
#insert "inserts/globals.agc"

#include "source/misc.agc"
#include "source/vector2.agc"
#include "source/mainMenu.agc"
#include "source/map.agc"
#include "source/ghosts.agc"
#include "source/pac-man.agc"
#include "source/keys.agc"
#include "source/editor.agc"
#include "source/game.agc"


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
	
	Print_Debug(FALSE)
	
	Sync()
loop

// This will control what state the app is in.
// Case 0 is main menu.
// Case 1 is game.
// Case 2 is editor.
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
			UpdateGame(game)
			if GetRawKeyPressed(27) // Escape
				DeleteGame(game)
				MainMenu_Show()
				AppState = APPSTATE_MAINMENU
			endif
		endcase
		case APPSTATE_EDITOR:
			UpdateEditor()
			if GetRawKeyPressed(27) // Escape
				DeleteEditor()
				MainMenu_Show()
				AppState = APPSTATE_MAINMENU
			endif
		endcase
	endselect
endfunction

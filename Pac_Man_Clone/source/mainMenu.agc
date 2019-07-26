
/*
CONTRIBUTORS:
	IronManhood
	
DATE:
	last updated 07/26/2019 by IronManhood
	
PURPOSE:
	Source code for a simple main menu screen.

DOCUMENTATION:
	

FUNCTIONS:
	
	
EXAMPLE:

*/




type t_Main_Menu
	title_txtID as integer
	
	play_txtID as integer
	play_sprID as integer
	
	edit_txtID as integer
	edit_sprID as integer
	
	created as integer
	active as integer
endtype


global mainmenu as t_Main_Menu



function MainMenu_Create()
	if mainmenu.created = FALSE
		mainmenu.created = TRUE
		mainmenu.active = TRUE
		
		// Create title text.
		mainmenu.title_txtID = CreateText("AGK Pac Man Clone")
		SetTextSize(mainmenu.title_txtID, resy(0.15))
		SetTextAlignment(mainmenu.title_txtID, 1)
		SetTextPosition(mainmenu.title_txtID, resx(0.5), resy(0.15))
		
		// Create play button background sprite.
		mainmenu.play_sprID = CreateSprite(0)
		SetSpriteColor(mainmenu.play_sprID, 0, 0, 255, 255)
		
		// Create play button text.
		mainmenu.play_txtID = CreateText("Play")
		SetTextSize(mainmenu.play_txtID, resy(0.1))
		SetTextAlignment(mainmenu.play_txtID, 1)
		SetTextPosition(mainmenu.play_txtID, resx(0.5), resy(0.4125))
		
		// Position and size the button sprite to fit the text.
		SetSpriteSize(mainmenu.play_sprID, GetTextTotalWidth(mainmenu.play_txtID) * 1.1, GetTextTotalHeight(mainmenu.play_txtID) * 1.1)
		SetSpritePositionByOffset(mainmenu.play_sprID, GetTextX(mainmenu.play_txtID), GetTextY(mainmenu.play_txtID) + (GetTextTotalHeight(mainmenu.play_txtID) * 0.5))
		
		
		
		// Create editor button background sprite.
		mainmenu.edit_sprID = CreateSprite(0)
		SetSpriteColor(mainmenu.edit_sprID, 0, 0, 255, 255)
		
		// Create editor button text.
		mainmenu.edit_txtID = CreateText("Editor")
		SetTextSize(mainmenu.edit_txtID, resy(0.1))
		SetTextAlignment(mainmenu.edit_txtID, 1)
		SetTextPosition(mainmenu.edit_txtID, resx(0.5), resy(0.6))
		
		// Position and size the button sprite to fit the text.
		SetSpriteSize(mainmenu.edit_sprID, GetTextTotalWidth(mainmenu.edit_txtID) * 1.1, GetTextTotalHeight(mainmenu.edit_txtID) * 1.1)
		SetSpritePositionByOffset(mainmenu.edit_sprID, GetTextX(mainmenu.edit_txtID), GetTextY(mainmenu.edit_txtID) + (GetTextTotalHeight(mainmenu.edit_txtID) * 0.5))
	endif
endfunction





// Completely delete the menu.
function MainMenu_Delete()
	if GetTextExists(mainmenu.title_txtID) then DeleteText(mainmenu.title_txtID)
	if GetTextExists(mainmenu.play_txtID) then DeleteText(mainmenu.play_txtID)
	if GetSpriteExists(mainmenu.play_sprID) then DeleteSprite(mainmenu.play_sprID)
	if GetTextExists(mainmenu.edit_txtID) then DeleteText(mainmenu.edit_txtID)
	if GetSpriteExists(mainmenu.play_sprID) then DeleteSprite(mainmenu.play_sprID)
	mainmenu.created = FALSE
	mainmenu.active = FALSE
	mainmenu.title_txtID = 0
endfunction




// Hide the menu.
function MainMenu_Hide()
	SetTextVisible(mainmenu.title_txtID, FALSE)
	SetTextVisible(mainmenu.play_txtID, FALSE)
	SetSpriteVisible(mainmenu.play_sprID, FALSE)
	SetSpriteActive(mainmenu.play_sprID, FALSE)
	SetTextVisible(mainmenu.edit_txtID, FALSE)
	SetSpriteVisible(mainmenu.edit_sprID, FALSE)
	SetSpriteActive(mainmenu.edit_sprID, FALSE)
	mainmenu.active = FALSE
endfunction

// Show the menu.
function MainMenu_Show()
	SetTextVisible(mainmenu.title_txtID, TRUE)
	SetTextVisible(mainmenu.play_txtID, TRUE)
	SetSpriteVisible(mainmenu.play_sprID, TRUE)
	SetSpriteActive(mainmenu.play_sprID, TRUE)
	SetTextVisible(mainmenu.edit_txtID, TRUE)
	SetSpriteVisible(mainmenu.edit_sprID, TRUE)
	SetSpriteActive(mainmenu.edit_sprID, TRUE)
	mainmenu.active = TRUE
endfunction




// Update the button.
function MainMenu_Update()
	if mainmenu.created = TRUE
		if mainmenu.active = TRUE
			if GetSpriteHitTest(mainmenu.play_sprID, GetPointerX(), GetPointerY())
				SetSpriteColor(mainmenu.play_sprID, 0, 255, 0, 255)
				if GetPointerPressed()
					MainMenu_Hide()
//~					LoadMap("map.csv", map)
					LoadMap("map.json", map)
					AppState = APPSTATE_GAME
				endif
			else
				SetSpriteColor(mainmenu.play_sprID, 0, 0, 255, 255)
			endif
			
			if GetSpriteHitTest(mainmenu.edit_sprID, GetPointerX(), GetPointerY())
				SetSpriteColor(mainmenu.edit_sprID, 0, 255, 0, 255)
				if GetPointerPressed()
					MainMenu_Hide()
					CreateEditorUI()
					AppState = APPSTATE_EDITOR
				endif
			else
				SetSpriteColor(mainmenu.edit_sprID, 0, 0, 255, 255)
			endif
		endif
	endif
endfunction








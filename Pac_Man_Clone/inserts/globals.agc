
// Use this for global variable declaration only.

#constant APPSTATE_MAINMENU	0
#constant APPSTATE_GAME		1
#constant APPSTATE_EDITOR	2

global res as t_Vector_2
res.x = GetMaxDeviceWidth() : res.y = GetMaxDeviceHeight()

global SyncRate as float = 60.0
global fullscreen as integer = FALSE
global PrintSize as float = 36.0
global AppState as integer = 0

global mediaDirectory as string
mediaDirectory = GetReadPath() + "media"

//global clr_white as integer
//global clr_red as integer
//global clr_green as integer
//global clr_blue as integer
//global clr_lightblue as integer
//global clr_lightgrey as integer
//global clr_darkgrey as integer
//global clr_violet as integer
//global clr_tan as integer
//global clr_yellow as integer
//global clr_pink as integer
//global clr_cyan as integer
//global clr_orange as integer
//clr_white = MakeColor(255, 255, 255)
//clr_red = MakeColor(255, 0, 0)
//clr_green = MakeColor(0, 255, 0)
//clr_blue = MakeColor(0, 0, 255)
//clr_lightblue = MakeColor(12, 160, 225)
//clr_lightgrey = MakeColor(161, 161, 161)
//clr_darkgrey = MakeColor(31, 31, 31)
//clr_violet = MakeColor(225, 190, 225)
//clr_tan = MakeColor(255,224,189)
//clr_yellow = MakeColor(255,255,0)
//clr_pink = MakeColor(255,20,147)
//clr_cyan = MakeColor(0,255,255)
//clr_orange = MakeColor(255, 128, 0)

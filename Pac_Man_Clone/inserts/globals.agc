
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

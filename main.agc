
// Project: Pac-Man Clone 
// Created: 2019-07-18

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Pac-Man Clone" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 60, 0 ) // 60fps instead of 999999 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts



do
    

    Print( ScreenFPS() )
    Sync()
loop

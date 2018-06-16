-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.HiddenStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"
sound=0
nomer=2

widget.setTheme( "widget_theme_android_holo_dark" )
sceneGR = display.newGroup()
--constants
cw=display.contentWidth
ch=display.contentHeight
cx= display.contentCenterX
cy= display.contentCenterY


	back = display.newImage("img/back_btn.png", 40, 35)
    back:addEventListener("touch", function(event) if event.phase == 'ended' then composer.gotoScene("scene.menu", {effect = "slideRight", time = 500}) end end)

		
composer.gotoScene ( "scene.menu" )
--composer.gotoScene ( "scene.calcsubsid" )
--composer.gotoScene ( "scene.nfp1" )



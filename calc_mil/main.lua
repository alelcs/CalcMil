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

sceneG=display.newGroup()
--constants
cw=display.contentWidth
ch=display.contentHeight
cx= display.contentCenterX
cy= display.contentCenterY

local Ball = display.newText( "Баллов:", cx-100, 60, "font/font.ttf", 90 )
    Ball:setFillColor( 1 )
local SumBall = display.newText( "0", cx+100, 60, "font/font.ttf", 90 )
    SumBall:setFillColor( 1 )

	back = display.newImage("img/back_btn.png", 40, 35)
    back:addEventListener("touch", function(event) if event.phase == 'ended' then composer.gotoScene("scene.menu", {effect = "slideRight", time = 500}) end end)



sceneG:insert(Ball)
sceneG:insert(SumBall)
sceneG.isVisible =false

		
composer.gotoScene ( "scene.menu" )
--composer.gotoScene ( "scene.calcsubsid" )
--composer.gotoScene ( "scene.nfp1" )



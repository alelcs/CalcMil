-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require( "widget" )
widget.setTheme( "widget_theme_android_holo_dark" )

local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

--composer.gotoScene( "scene.nfp" )   
end

function scene:key(event)

    if ( event.keyName == "back" ) or ("b"==event.keyName) then

          -- handle the back key press however you choose
          composer.gotoScene("scene.menu", {effect = "crossFade", time = 500}) 
          return true
    end
end



function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		
	elseif phase == "did" then
		-- Called when the scene is now on screen
	
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
                
		composer.removeScene("scene.nfp-menu", true)   
        
	end
end

function scene:destroy( event )
	local sceneG = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end


-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
Runtime:addEventListener( "key", scene )
-----------------------------------------------------------------------------------------

return scene
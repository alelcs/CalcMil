-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
-- Add streaks
    local fx = require( "com.ponywolf.ponyfx" )
    
    local function evn(event)
        if (event.action == "clicked") and ( event.index==1) then 
            os.exit()
        end
    end

function scene:create( event )
	local sceneGroup = self.view
    composer.removeHidden( true )
	sceneG.isVisible =false
    back.isVisible =false
	-- Called when the scene's view does not exist.
		
	-- create a white background to fill screen
	local streaks = fx.newStreak()
       
        audio.play(audio.loadSound("img/frogso_theme.mp3"),{channel=1,loops=-1})
        audio.setVolume(0.15,{channel=1})

        
        

    streaks.x, streaks.y = display.contentCenterX, display.contentCenterY
    streaks:toBack()
    streaks.alpha = 0.1
    streaks.speed = 0.5

    local background = display.newImageRect( "img/bg.jpg", cw, ch )
    background.x = cx
    background.y = cy
    sceneGroup:insert( background )

	-- create some text
	 title = display.newEmbossedText( "Военный калькулятор", display.contentCenterX, 80, "font/font.ttf", 80 )
	title:setFillColor( 1 )
    local color = 
{
    highlight = { r=1, g=1, b=1 },
    shadow = { r=0.7, g=1, b=0.7 }
}

title:setEmbossColor( color )
transition.scaleTo( title, { xScale=1.2, yScale=1.2, time=3000 } )

	 title1 = display.newText( "2018", display.contentCenterX, display.contentHeight-30, native.systemFont, 32 )
	title1:setFillColor( 1 )	-- white	

	local function handleButtonEvent( event )
        
    	if ( "ended" == event.phase ) then
       		if (event.target.id=="exit") then native.cancelAlert( native.showAlert( "Предупреждение", "Вы точно хотите выйти?", { "ДА", "НЕТ" }, evn) )
                else 
                    composer.gotoScene( event.target.id, {effect = "crossFade", time = 600} )
                    composer.removeScene("scene.menu",true)
            end 
        end
	end

    local titleGradient = {
        type = 'gradient',
        color1 = { 189/255, 203/255, 220/255, 1 }, 
        color2 = { 89/255, 116/255, 152/255, 1 },
        direction = "down"
    }

	button1 = widget.newButton(
    {
        label = "Калькулятор зарплаты",
        onEvent = handleButtonEvent,
        id = "scene.calc",
        emboss = true,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 450,
        height = 70,
        cornerRadius = 10,
        fillColor = { default={titleGradient}, over={189/255, 203/255, 220/255,0.6} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        x=display.contentCenterX,
        y = display.contentCenterY-250,
        fontSize =32,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
    }
)
	button2 = widget.newButton(
    {
        label = "Калькулятор поднаёма",
        onEvent = handleButtonEvent,
        id = "scene.calc1",
        emboss = true,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 450,
        height = 70,
        cornerRadius = 10,
        fillColor = { default={titleGradient}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        x=display.contentCenterX,
        y = display.contentCenterY-150,
        fontSize =32,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
    }
)
	button3 = widget.newButton(
    {
        label = "Калькулятор накоплений \n     по военной ипотеке",
        onEvent = handleButtonEvent,
        emboss = true,
        id = "scene.ipotek",
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        align = "center",
        width = 450,
        height = 70,
        cornerRadius = 10,
        fillColor = { default={titleGradient}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        x=display.contentCenterX,
        y = display.contentCenterY-50,
        fontSize =32,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
    }
)
	   button4 = widget.newButton(
    {
        label = "НФП-2018",
        onEvent = handleButtonEvent,
        emboss = true,
        id = "scene.nfp1",
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        align = "center",
        width = 450,
        height = 70,
        cornerRadius = 10,
        fillColor = { default={titleGradient}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        x=display.contentCenterX,
        y = display.contentCenterY+50,
        fontSize =32,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
    }
)

            button5 = widget.newButton(
    {
        label = "Калькулятор субсидии",
        onEvent = handleButtonEvent,
        emboss = true,
        id = "scene.calcsubsid",
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        align = "center",
        width = 450,
        height = 70,
        cornerRadius = 10,
        fillColor = { default={titleGradient}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        x=display.contentCenterX,
        y = display.contentCenterY+150,
        fontSize =32,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
    }
)

            button6 = widget.newButton(
    {
        label = "Калькулятор пенсии \n военнослужащего",
        onEvent = handleButtonEvent,
        emboss = true,
        id = "scene.calcpens",
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        align = "center",
        width = 450,
        height = 70,
        cornerRadius = 10,
        fillColor = { default={titleGradient}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        x=display.contentCenterX,
        y = display.contentCenterY+250,
        fontSize =32,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
    }
)
        exit = widget.newButton(
    {      onEvent = handleButtonEvent,
        id = "exit",
        
        defaultFile = "img/exit.jpg",
        width = 200,
        height = 75,
        
        x = display.contentCenterX,
        y = display.contentHeight-110,
        
    }
)
	sounds = display.newImage(sceneGroup, "img/sound.png", 450, display.contentHeight-75);  
    sounds:addEventListener("touch", function(event)
    
            if event.phase == 'ended' then
                 if audio.isChannelPaused(1) then 
                    audio.resume(1) 
                    sound=1
                    sounds:setFillColor( 40/255, 190/255, 50/255 )
                    else
                     audio.pause(1)
                     sound=0
                     sounds:setFillColor( 1, 0, 0 )
                    end
                
            end
        end
    );
    if sound ==0 then 
        audio.pause(1) 
        sounds:setFillColor( 1, 0, 0 )
    else
        sounds:setFillColor( 40/255, 190/255, 50/255 )
    end

--animations

        transition.from ( title, { delay = 10, time = 300, xScale = 2, yScale = 2, alpha = 0, transition = easing.outBounce })    
        transition.from ( button1, { delay = 100, time = 600, xScale = 2, yScale = 2, alpha = 0, transition = easing.inOutBack })    
        transition.from ( button2, { delay = 300, time = 800, xScale = 2, yScale = 2, alpha = 0, transition = easing.inOutBack })
        transition.from ( button3, { delay = 500, time = 1000, xScale = 2, yScale = 2, alpha = 0, transition = easing.inOutBack })
        transition.from ( button4, { delay = 700, time = 1200, xScale = 2, yScale = 2, alpha = 0, transition = easing.inOutBack })
        transition.from ( button5, { delay = 900, time = 1400, xScale = 2, yScale = 2, alpha = 0, transition = easing.inOutBack })
        transition.from ( button6, { delay = 1100, time = 1600, xScale = 2, yScale = 2, alpha = 0, transition = easing.inOutBack })


        transition.from ( exit, { delay = 1300, time = 1400, xScale = 2, yScale = 2, alpha = 0, transition = easing.inOutBack })
        transition.from ( title1, { delay = 1300, time = 1400, xScale = 2, yScale = 2, alpha = 0, transition = easing.inOutBack })
    
        transition.from ( sounds, { delay = 1300, time = 1200, xScale = 2, yScale = 2, alpha = 0, transition = easing.outBounce }) 

    local sceneGroup = self.view
   
	sceneGroup:insert( background )
	sceneGroup:insert( title )
    sceneGroup:insert( title1 )
	sceneGroup:insert(button1)
	sceneGroup:insert(button2)
	sceneGroup:insert(button3)
    sceneGroup:insert(button4)
    sceneGroup:insert(button5)
    sceneGroup:insert(button6)
	sceneGroup:insert(sounds)
    sceneGroup:insert(streaks)
    sceneGroup:insert(exit)

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
       
	elseif phase == "did" then


        
	end	
end
function scene:key(event)
    if ( event.keyName == "back" ) or ("b"==event.keyName) then
         -- handle the back key press however you choose
       -- native.cancelAlert( native.showAlert( "Предупреждение", "Вы точно хотите выйти?", { "ДА", "НЕТ" }, evn) )
    end
end


function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
Runtime:addEventListener( "key", scene )

-----------------------------------------------------------------------------------------

return scene
-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require( "widget" )
local scene = composer.newScene()
local icons = {}
local scrollView
local activ_data=""
local norma=24
local rez=0
local rf=0

function scene:create( event )
	local sceneGroup = self.view
    back.isVisible=true

	local background = display.newImageRect( "img/bg.jpg", cw, ch )
    background.x = cx
    background.y = cy
    sceneGroup:insert( background )

	title = display.newText( "Ваша выплата составит:", display.contentCenterX+30, 700, "font/font.ttf", 65 )
	title:setFillColor( 1 )	-- white
	babki = display.newText( "0 p", display.contentCenterX, 770, "font/font.ttf", 80 )
	babki:setFillColor( 1 )	-- white

	local newTextParams = { text = "КАЛЬКУЛЯТОР РАСЧЁТА\n денежной компенсации за наем (поднаем)\n жилых помещений", 
						x = display.contentCenterX, 
						y = 180, 
						width = display.contentWidth, height = 310, 
						font = "font/font.ttf", fontSize = 45, 
						align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 1 )  

	
-- Touch event listener for background image
local function summa()
		rez=norma*rf
	 babki.text=(math.round((rez)).."p.")
	end

local function iconListener( event )
    local id = event.target.id

    if ( event.phase == "moved" ) then
        local dx = math.abs( event.x - event.xStart ) 
        if ( dx > 5 ) or (dx<5) then
            scrollView:takeFocus( event ) 
        end
    elseif ( event.phase == "ended" ) then
    
    if data[id].factor>0 then
        if activ_data=="scene.base.norma" then
        button1:setLabel( icons[id]:getLabel() )
        norma=data[id].factor
    	end
		if activ_data=="scene.base.rf" then
        button2:setLabel( icons[id]:getLabel() )
        rf=data[id].factor
    	end        
        timer.performWithDelay( 10, function() summa(); scrollView:removeSelf(); scrollView = nil; end )
    end
    end
    return true
end

	local function showSlidingMenu( event )
     if ( event.phase == "moved" ) then
        
    elseif ( event.phase == "ended" ) then

        scrollView = widget.newScrollView
        {
            width = 500,
            height = 900,
            scrollWidth = 400,
            scrollHeight = 1500,
            horizontalScrollDisabled = true,
            hideBackground = false,
            listener = scrollListener,
            backgroundColor = { 0.8, 0.8, 0.8 }
        }
	
        scrollView.x = display.contentCenterX
        scrollView.y = display.contentCenterY
        
       -- scrollView:insert( scrollViewBackground )
        --generate icons
        activ_data=event.target.id
        data = require(event.target.id); -- вызов файла data.lua
        for i = 1, #data do
        	 
        	local colour=data[i].factor==0 and 0 or i%2>0 and 0.8 or 0.7
        	local colour1=data[i].factor>0 and 0 or 1
        	local size=string.len(data[i].name)>40 and 32-math.round(string.len(data[i].name)/8) or 32
            icons[i] = widget.newButton(
    			{
        	label = data[i].name,
       		onEvent = iconListener,
       		id = i,
        	--emboss = true,
        -- Properties for a rounded rectangle button
        	shape = "roundedRect",
        	width = 450,
        	--height = 55,
        	cornerRadius = 5,
        	fillColor = { default={colour, colour, colour, 1}, over={0.7,0.7,0.9,0.9} },
        	strokeColor = { default={0.1, 0.1, 0.1, 0.7}, over={0.7, 0.7, 0.7, 0.9} },
        	strokeWidth = 3,
        	x= display.contentCenterX-25,
        	y = 60*i,
        	fontSize =size,
        	labelColor = { default={ colour1,colour1,colour1 }, over={ 1, 0, 0, 0.5 } }
    }
)

            scrollView:insert( icons[i] )

        end
    end
    return true
end


local options_text = {      
		text="",
    	x = display.contentCenterX,
    	width = display.contentWidth,
    	font = native.systemFont,   
    	fontSize = 30,
    	align = "center"  }

local options_button ={
		label = "",
        onEvent = showSlidingMenu,
        id = "",
        emboss = true,
        shape = "roundedRect",
        width = 450,
        height = 60,
        cornerRadius = 10,
        fillColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        x=display.contentCenterX,
        y = 0,
        fontSize =30,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } } }

        --заполнение скролера информацией
        local text1=display.newText(options_text)
			text1.text="Норма общей площади жилого помещения:"
			text1:setFillColor( 0.2,0.7,0.3 )	-- white
			text1.y=280

		button1 = widget.newButton(options_button)
			button1:setLabel("Состав семьи")
			button1.y=350
			button1.id="scene.base.norma"
		local text2=display.newText(options_text)
			text2.text="Место прохождения военнослужащим военной службы:"
			text2:setFillColor( 0.2,0.7,0.3 )	-- white
			text2.y=430

		button2 = widget.newButton(options_button)
			button2:setLabel("Субъект РФ")
			button2.y=500
			button2.id="scene.base.rf"



	-- all objects must be added to group (e.g. self.view)

	sceneGroup:insert( text1 )
	sceneGroup:insert( button1 )
	sceneGroup:insert( text2 )
	sceneGroup:insert( button2 )
	sceneGroup:insert( title )
	sceneGroup:insert( babki )
	sceneGroup:insert( summary )
end



function scene:key(event)

    if ( event.keyName == "back" ) or ("b"==event.keyName) then
        composer.gotoScene("scene.menu", {effect = "crossFade", time = 500}) 
        return true
    end
end

Runtime:addEventListener( "key", scene )

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )

    composer.removeScene("scene.calc", true)  

end

function scene:destroy( event )

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
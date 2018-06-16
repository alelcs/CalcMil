-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
widget.setTheme( "widget_theme_ios7" )
local icons = {}
local scrollView
local mes=0
local god=0
local sum={0,0,0,0,37000,40600,82800,89900,168000,175600,189800,205200,222000,233100,245880,245880,260141,268465.6,275000,280000,285000,290000,295000,3000000,0,0,0}



function scene:create( event )
	local sceneGroup = self.view
	local mainGroup = display.newGroup()
	local background = display.newImageRect( "img/bg.jpg", display.contentWidth, display.contentHeight )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	sceneGroup:insert( background )



	-- create some text
	
	local newTextParams = { text = "КАЛЬКУЛЯТОР \nнакоплений\nпо военной ипотеке", 
						x = display.contentCenterX, 
						y = 160, 
						width = 450, 
						font = "font/font.ttf", fontSize = 75, 
						align = "center" }
	local title = display.newText( newTextParams )
	title:setFillColor( 1 ) 

local function summas()
	if god>0 and mes>0 then
	local godes=god%2000
	local sum0=0
		sum0=mes==1 and sum0 or 0-sum[godes]*(mes)/12
	for z=godes, os.date('%y')-1 do
		 sum0=sum0+sum[z]
	end

local sss=tostring(math.round(sum[tonumber(os.date('%y'))]*tonumber(os.date('%m'))/12+sum0))
local len=string.len(sss )

	summa.text=(len<7 and "" or (sss:sub( len-6, len-6 ).."."))..sss:sub( len-5, len-3 ).."."..sss:sub( len-2, len )
	
end
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
        if activ_data=="scene.base.mm" then
        button1:setLabel( icons[id]:getLabel() )
        mes=data[id].factor
    	end
		if activ_data=="scene.base.yy" then
        button2:setLabel( icons[id]:getLabel() )
        god=data[id].factor
    	end        
        timer.performWithDelay( 10, function() summas(); scrollView:removeSelf(); scrollView = nil; end )
    end
    end
    return true
end

	local function showSlidingMenu( event )
     if ( event.phase == "moved" ) then
        
    elseif ( event.phase == "ended" ) then

        scrollView = widget.newScrollView
        {
            width = 540,
            height = 960,
            scrollWidth = 400,
            scrollHeight = 1500,
            horizontalScrollDisabled = true,
            hideBackground = false,
            listener = scrollListener,
            backgroundColor = { 0.8, 0.8, 0.8 }
        }
	
        scrollView.x = display.contentCenterX
        scrollView.y = display.contentCenterY
        
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
        	emboss = true,
        -- Properties for a rounded rectangle button
        	shape = "roundedRect",
        	width = 500,
        	--height = 55,
        	cornerRadius = 5,
        	fillColor = { default={colour, colour, colour, 1}, over={0.7,0.7,0.9,0.9} },
        	strokeColor = { default={0.1, 0.1, 0.1, 0.7}, over={0.7, 0.7, 0.7, 0.9} },
        	strokeWidth = 3,
        	x= display.contentCenterX,
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

		local myRoundedRect3 = display.newRoundedRect( display.contentCenterX, 440, 500, 140, 12 )
		myRoundedRect3.strokeWidth = 3
		myRoundedRect3:setFillColor( 0.5,0.2,0.4,0.3 )
		myRoundedRect3:setStrokeColor( 1, 0, 0 )
		mainGroup:insert( myRoundedRect3 )


	label2 = display.newText( mainGroup, "Размер ваших накоплений составляет:", 20, myRoundedRect3.y+110, appFont, 28 )
	label2.anchorX = 0 --положение слева
	summa = display.newText( mainGroup, "0", display.contentCenterX, myRoundedRect3.y+200, "font/font.ttf", 80 )

	button1 = widget.newButton({
		label = "Месяц",
        onEvent = showSlidingMenu,
        id = "scene.base.mm",
        emboss = true,
        shape = "roundedRect",
        width = 290,
        height = 60,
        cornerRadius = 10,
        x=170,
        y=460,
        fillColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        fontSize =30,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } } })

	button2 = widget.newButton({
		label = "Год",
        onEvent = showSlidingMenu,
        id = "scene.base.yy",
        emboss = true,
        shape = "roundedRect",
        width = 160,
        height = 60,
        cornerRadius = 10,
        fillColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        x=430,
        y=460,
        fontSize =30,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } } })


	
	label3 = display.newText( mainGroup, "Дата вступления в программу:", 40, myRoundedRect3.y-50, appFont, 30 )
	label3.anchorX = 0 --положение слева+

	mainGroup:insert( button1 )
	mainGroup:insert( button2 )
	
	mainGroup:insert( label2 )
	mainGroup:insert( label3 )	
	mainGroup:insert( summa )	



	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	
	sceneGroup:insert( title )
	sceneGroup:insert( mainGroup)
		local back = display.newImage(sceneGroup, "img/back_btn.png", 30,35);  
    back.height=60
    back.width=70
    back:addEventListener("touch", function(event)
    
            if event.phase == 'ended' then
              
        composer.gotoScene("scene.menu", {effect = "crossFade", time = 500}) 
                  
            end
        end
    );
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
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
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
        composer.removeScene("scene.ipotek", true)   
    end
end

function scene:destroy( event )
	local sceneGroup = self.view

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
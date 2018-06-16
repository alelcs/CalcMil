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
local H=33
local D=0
local K=1.85
 numericField2 = native.newTextField( 435, 580, 130, 60 )
            numericField2.inputType = "number"
            numericField2.text = "37848"
            numericField2.isVisible=false
 numericField1 = native.newTextField( 435, 500, 130, 60 )
            numericField1.inputType = "number"
            numericField1.text = "0"
            numericField1.isVisible=false

function summa()

        local O=H+D-tonumber(numericField1.text)
        local P=O*tonumber(numericField2.text)*K
        title.text = "Размер субсидии за "..O.." кв.м.,\nсоставляет:"
     babki.text=(math.round((P)).."p.")
    end


function scene:create( event )
	local sceneGroup = self.view
    

	local background = display.newImageRect( "img/bg.jpg", cw, ch )
    background.x = cx
    background.y = cy
    sceneGroup:insert( background )

	title = display.newText( "Размер субсидии за 0 кв.м.,\nсоставляет:", display.contentCenterX, 870, "font/font.ttf", 65 )
	title:setFillColor( 1 )	-- white
	babki = display.newText( "0 p", display.contentCenterX+50, 900, "font/font.ttf", 80 )
	babki:setFillColor( 1 )	-- white

	local newTextParams = { text = "КАЛЬКУЛЯТОР РАСЧЁТА\n субсидии для приобретения или \n строительства жилых помещений", 
						x = display.contentCenterX, 
						y = 100, 
						width = display.contentWidth, height = 0, 
						font = "font/font.ttf", fontSize = 50, 
						align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 1 )  

	
-- Touch event listener for background image



local function iconListener( event )
    local id = event.target.id

    if ( event.phase == "moved" ) then
        local dx = math.abs( event.x - event.xStart ) 
        if ( dx > 5 ) or (dx<5) then
            scrollView:takeFocus( event ) 
        end
    elseif ( event.phase == "ended" ) then
    
    if data[id].factor>0 then
        if activ_data=="scene.base.normasubsid" then
        button1:setLabel( icons[id]:getLabel() )
        H=data[id].factor
    	end
		if activ_data=="scene.base.pravo" then
        button2:setLabel( icons[id]:getLabel() )
        D=data[id].factor
    	end        
        if activ_data=="scene.base.prodlet" then
        button5:setLabel( icons[id]:getLabel() )
        K=data[id].factor
        end       
        timer.performWithDelay( 10, function() summa(); numericField1.isVisible=true; numericField2.isVisible=true; back.isVisible=true; scrollView:removeSelf(); scrollView = nil; end )
    end
    end
    return true
end

	local function showSlidingMenu( event )
     if ( event.phase == "moved" ) then
        
    elseif ( event.phase == "ended" ) then
    back.isVisible=false
numericField1.isVisible=false
numericField2.isVisible=false
        scrollView = widget.newScrollView
        {
            width = 500,
            height = 700,
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
			text1.text="Количество членов семьи:"
			text1:setFillColor( 0.2,0.7,0.3 )	
			text1.y=210

		button1 = widget.newButton(options_button)
			button1:setLabel("Один военнослужащий")
			button1.y=270
			button1.id="scene.base.normasubsid"

		local text2=display.newText(options_text)
			text2.text="Право на дополнительную площадь:"
			text2:setFillColor( 0.2,0.7,0.3 )	
			text2.y=340

		button2 = widget.newButton(options_button)
			button2:setLabel("Нет:")
			button2.y=400
			button2.id="scene.base.pravo"

        local lines1 = display.newLine( 10, 450, 520, 450 )
            lines1:setStrokeColor( 1, 0, 0, 1 )
            lines1.strokeWidth = 4

        local text3=display.newText(options_text)
            text3.text="Имеющаяся площадь \n    жилых помещений:"
            text3:setFillColor( 0.2,0.7,0.3 )   
            text3.y=500
            text3.x=200

         

         
        local    buttons = widget.newButton(
    {
        label = "Норматив стоимости \n       1 кв.м., в рублях:",
        onEvent = (function() composer.showOverlay("scene.norma", {
                isModal = true,
                effect = "fade",
                time = 400,
            });     
            numericField1.isVisible=false;
            numericField2.isVisible=false;   
            back.isVisible=false;
            end),
        id = "scene.norma",
        emboss = true,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 330,
        height = 75,
        cornerRadius = 10,
        fillColor = { default={titleGradient}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        x=190,
        y = 580,
        fontSize =32,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
    }
)    
            


        local lines2 = display.newLine( 10, 630, 520, 630 )
            lines2:setStrokeColor( 1, 0, 0, 1 )
            lines2.strokeWidth = 4

        local text5=display.newText(options_text)
            text5.text="Продолжительности военной службы\nв календарном исчислении:"
            text5:setFillColor( 0.2,0.7,0.3 )   
            text5.y=670

        button5 = widget.newButton(options_button)
            button5:setLabel("от 10 до 16 лет")
            button5.y=750
            button5.id="scene.base.prodlet"
	-- all objects must be added to group (e.g. self.view)

	sceneGroup:insert( text1 )
	sceneGroup:insert( button1 )
	sceneGroup:insert( text2 )
	sceneGroup:insert( button2 )
    sceneGroup:insert( text3 )
    sceneGroup:insert( buttons )
    sceneGroup:insert( numericField1 )
    sceneGroup:insert( numericField2 ) 
    sceneGroup:insert( text5 )
    sceneGroup:insert( button5 )   
    sceneGroup:insert( lines1 )
    sceneGroup:insert( lines2 )
	sceneGroup:insert( title )
	sceneGroup:insert( babki )
	sceneGroup:insert( summary )


summa()
back.isVisible=true
end



function scene:key(event)

    if ( event.keyName == "back" ) or ("b"==event.keyName) then
        if back.isVisible==true then
        composer.gotoScene("scene.menu", {effect = "crossFade", time = 500}) 
        numericField1.isVisible=false
        numericField2.isVisible=false
        end
        return true
    end

end

Runtime:addEventListener( "key", scene )

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		numericField1.isVisible=true
        numericField2.isVisible=true
	elseif phase == "did" then
		
		
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
    --display.remove(numericField1)
    --display.remove(numericField2)
    local sceneGroup = self.view
    display.remove(sceneGroup)
    composer.removeScene("scene.calcsubsid", true)  

end

function scene:destroy( event )

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
    numericField1:addEventListener( "userInput", function() if numericField1.text~="" then summa(); end; end )
    numericField2:addEventListener( "userInput", function() if numericField2.text~="" then summa(); end; end  )
-----------------------------------------------------------------------------------------

return scene
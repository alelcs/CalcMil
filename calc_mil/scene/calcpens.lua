-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require("widget");

local scene = composer.newScene()
local scrollView
local scrollView1
local icons = {}
local activ_data=""
local data 
local button1,button2,button3,button4,button5,button6,button7,button8,button9,button10,button11,button12,button13,button14,button15

local k=1.04    --коэффициент прибавки
local rez=0
local rez13=0
local spis1,spis2,spis3,spis4,spis5,spis6,spis7=0,0,0,0,0,0,0
local war=0
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
local function summa()

local dd=spis1*(spis3/100+1)+spis2
    rez = (math.round((((dd)+(dd)*spis7/100)*(spis5/100+1))*spis4*spis6 + war)*100)/100
	     rez13=rez-(rez)*13/100 --nalog
if (rez==0) or (dd==0) then 
    babki.text="0p"
else
    babki.text=(math.round(rez).."p.-13%="..math.round(rez13).."p.")
end
end

-- Touch event listener for background image
local function iconListener( event )
    local id = event.target.id

    if ( event.phase == "moved" ) then
        local dx = math.abs( event.x - event.xStart ) 
        if ( dx > 5 ) or (dx<5) then
            scrollView:takeFocus( event ) 
        end
    elseif ( event.phase == "ended" ) then
    if id>1 then
        --spis2
        if activ_data=="scene.base.kt" then
        button1:setLabel( icons[id]:getLabel() )
        spis2=data[id].factor*k
    	end
        --spis1
		if activ_data=="scene.base.tb" then
        button2:setLabel( icons[id]:getLabel() )
        spis1=data[id].factor*k
    	end
        --spis3
    	if activ_data=="scene.base.kll" then
        button22:setLabel( icons[id]:getLabel() )
        spis3=data[id].factor
    	end
        --spis7
		if activ_data=="scene.base.kbm" then
        button3:setLabel( icons[id]:getLabel() )
        spis7=data[id].factor
    	end
        --spis4
		if activ_data=="scene.base.prodsl" then
        button4:setLabel( icons[id]:getLabel() )
        spis4=data[id].factor
    	end
        --spis5
    	if activ_data=="scene.base.mes" then
        button12:setLabel( icons[id]:getLabel() )
        spis5=data[id].factor
    	end
        --spis6
        if activ_data=="scene.base.dates" then
        button5:setLabel( icons[id]:getLabel() )
        spis6=data[id].factor
        end
        if activ_data=="scene.base.veteran" then
        button6:setLabel( icons[id]:getLabel() )
        war=data[id].factor
        end
        
        timer.performWithDelay( 10, function() summa(); scrollView:removeSelf(); scrollView = nil; end )
    end
    end
    return true
end



local function showSlidingMenu( event )
     if ( event.phase == "moved" ) then
        local dx = math.abs( event.x - event.xStart ) 
        if ( dx > 5 ) or (dx<5) then
            scrollView1:takeFocus( event ) 
        end
    elseif ( event.phase == "ended" ) then

        scrollView = widget.newScrollView
        {
            width = 540,
            height = 960,
            scrollWidth = 400,
            --scrollHeight = 1500,
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
        data = require(event.target.id) -- вызов файла data.lua

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
        	labelColor = { default={  colour1, colour1, colour1 }, over={ 1, 0, 0, 0.5 } }
    }
)
            scrollView:insert( icons[i] )
        end

    end
    return true
end


-- Called when the scene's view does not exist:
function scene:create( event )
	sceneGroup = self.view
back.isVisible =true

    local background = display.newImageRect( "img/bg.jpg", cw, ch )
    background.x = cx
    background.y = cy
    sceneGroup:insert( background )
    
	title = display.newText( "Ваша пенсия составляет:", display.contentCenterX+30, 50, "font/font.ttf", 65 )
	title:setFillColor( 1 )	-- white
	babki = display.newText( "0 p", display.contentCenterX, 120, native.systemFontBold, 50 )
	babki:setFillColor( 1 )	-- white

    local lin = display.newLine( 10, 150, 520, 150 )
            lin:setStrokeColor( 1, 1, 0, 1 )
            lin.strokeWidth = 3
    sceneGroup:insert(lin)

	sceneGroup:insert( title )
    sceneGroup:insert( babki )
 	
 	local function iconListener1( event )
    local id = event.target.id

    if ( event.phase == "moved" ) then
        local dx = math.abs( event.x - event.xStart ) 
        if ( dx > 5 ) or (dx<5) then
            scrollView1:takeFocus( event ) 
        end
    end
    return true
end

	local options_text = {      
		text="",
    	x = display.contentCenterX,
    	width = display.contentWidth,
    	font = native.systemFont,   
    	fontSize = 32,
    	align = "center"  }

	local options_button ={
		label = "",
        onEvent = showSlidingMenu,
        id = "",
        emboss = true,
        shape = "roundedRect",
        width = 450,
        height = 70,
        cornerRadius = 10,
        fillColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        x=display.contentCenterX,
        y = 0,
        fontSize =30,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } } }
 
        scrollView1 = widget.newScrollView
        {
            width = display.contentWidth,
            height = 750,
            scrollWidth =  display.contentWidth,
            scrollHeight = 2500,
            horizontalScrollDisabled = true,
            hideBackground = true,
            listener = scrollListener
        }
	
        scrollView1.x = display.contentCenterX
        scrollView1.y = display.contentCenterY+50

        --заполнение скролера информацией
        --spis2
        local text1=display.newText(options_text)
			text1.text="Оклад по воинскому званию:"
			text1:setFillColor( 0.2,0.7,0.3 )	-- white
			text1.y=20

		button1 = widget.newButton(options_button)
			button1:setLabel("Выберите воинское звание")
			button1.y=80
			button1.id="scene.base.kt"

	scrollView1:insert(text1)
	scrollView1:insert(button1)
--spis1
		local text2=display.newText(options_text)
			text2.text="Оклад по воинскому должности:"
			text2:setFillColor( 0.2,0.7,0.3 )	-- white
			text2.y=150

		button2 = widget.newButton(options_button)
			button2:setLabel( "выберите воинскую должность")
        	button2.id = "scene.base.tb"
        	button2.y = 210,
 
	scrollView1:insert(text2)
	scrollView1:insert(button2)
--spis3
		local text22=display.newText(options_text)
		text22.text="Надбавка за квалификационную категорию летному составу:"
		text22:setFillColor( 0.2,0.7,0.3 )	-- white
		text22.y=300

		button22 = widget.newButton(options_button)
		button22:setLabel( "укажите КК для летного состава")
        button22.id = "scene.base.kll"
        button22.y = 380,
 
	scrollView1:insert(text22)
	scrollView1:insert(button22)

		local lines = display.newLine( 10, 440, 520, 440 )
			lines:setStrokeColor( 1, 0, 0, 1 )
			lines.strokeWidth = 4
		scrollView1:insert(lines)

--spis7
		local text3=display.newText(options_text)
			text3.text="Надбавка за выслугу лет:"
			text3:setFillColor( 0.2,0.7,0.3 )	-- white
			text3.y=470
		button3 = widget.newButton(options_button)
			button3:setLabel ("Укажите выслугу лет")
        	button3.id = "scene.base.kbm"
        	button3.y = 530
	scrollView1:insert(text3)
	scrollView1:insert(button3)


--spis4
		local text4=display.newText(options_text)
			text4.text= "Общая продолжительность военной службы, учитываемая для назначения пенсии:"
			text4:setFillColor( 0.2,0.7,0.3 )	-- white
			text4.y=650
		button4 = widget.newButton(options_button)
			button4:setLabel ("Укажите выслугу лет\n при выходе на пенсию")
        	button4.id = "scene.base.prodsl"
        	button4.y = 750
	scrollView1:insert(text4)
	scrollView1:insert(button4)

--spis5
        local text12=display.newText( options_text)
            text12.text="Районный коэффициент:"
            text12:setFillColor( 0.2,0.7,0.3 )
            text12.y=830
        button12 = widget.newButton(options_button)
            button12:setLabel ("0%")
            button12.id = "scene.base.mes"
            button12.y = 890
    scrollView1:insert(text12)
    scrollView1:insert(button12)

        local lines2 = display.newLine( 10, 940, 520, 940 )
            lines2:setStrokeColor( 1, 0, 0, 1 )
            lines2.strokeWidth = 5
        scrollView1:insert(lines2)

--spis6
        local text5=display.newText( options_text)
            text5.text="Укажите дату, на которую необходимо рассчитать военную пенсию"
            text5:setFillColor( 0.2,0.7,0.3 )
            text5.y=1020
        button5 = widget.newButton(options_button)
            button5:setLabel ("выберите дату")
            button5.id = "scene.base.dates"
            button5.y = 1120
    scrollView1:insert(text5)
    scrollView1:insert(button5)

--war
		local text6=display.newText( options_text)
			text6.text="Надбавка ветерану боевых действий:"
			text6:setFillColor( 0.2,0.7,0.3 )
			text6.y=1220
		button6 = widget.newButton(options_button)
			button6:setLabel ("0%")
        	button6.id = "scene.base.veteran"
        	button6.y = 1300
	scrollView1:insert(text6)
	scrollView1:insert(button6)

        local lines1 = display.newLine( 10, 1350, 520, 1350 )
            lines1:setStrokeColor( 1, 0, 0, 1 )
            lines1.strokeWidth = 4
        scrollView1:insert(lines1)




      sceneGroup:insert( scrollView1 )

end

function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
		
	end
	
end
function scene:key(event)

    if ( event.keyName == "back" ) or ("b"==event.keyName) then

          -- handle the back key press however you choose
          composer.gotoScene("scene.menu", {effect = "crossFade", time = 500}) 
          return true
    end
end


function scene:hide( event )
	   composer.removeScene("scene.calcpens", true)   
end

function scene:destroy( event )

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
Runtime:addEventListener( "key", scene )
---------------------------------------------------------------------------------

return scene


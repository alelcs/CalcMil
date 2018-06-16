-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require( "widget" )
local base=require( "scene.nfpbase" )

widget.setTheme( "widget_theme_android_holo_dark" )
local scene = composer.newScene()
local icons = {}
local scrollView
local activ_data=""
local norma=24
local rez=0
local rf=5
local bals
local dates
local nomBut=1
local data = {
{"",1,4,5,6,7,8.1,8.2,9,10,11.1,11.2,12.1,12.2,13.2,13.2,40,41,42,43,45.1,45.2,46.1,46.2,47,48,52,53,54,57.1,57.2,57.3,58,59},

{"Упражнение","Отжимание от пола","Подтягивание на перекладине","Поднимание ног к перекладине","Подъем переворотом на перекладине","Подъем силой на перекладине",
    "Жим штанги 70 кг лёжа, до 70кг","Жим штанги 70 кг лёжа, свыше 70кг","Отжимание на брусьях","Угол в упоре на брусьях",
    "Рывок гири, вес 24 кг, до 70 кг","Рывок гири, вес 24 кг, свыше 70 кг","Толчок двух гирь по 24кг, \nпо короткому циклу, до 70 кг",
    "Толчок двух гирь по 24кг, \nпо короткому циклу, до 70 кг","Толчок двух гирь 24кг \nпо длинному циклу, свыше 70 кг","Толчок двух гирь 24кг \nпо длинному циклу, свыше 70 кг",
    "Бег на 60 м","Бег на 100 м","Челночный бег 10х10 м","Бег на 400 м","Бег на 1 км, до 35 лет","Бег на 1 км, свыше 35 лет",
    "Бег на 3 км, до 35 лет","Бег на 3 км, свыше 35 лет","Бег на 5 км","Марш-бросок на 5 км","Метание гранаты 600 г на дальность",
    "Лыжная гонка на 5 км","Лыжная гонка на 10 км","Плавание на 50 м вольным стилем","Плавание на 100м вольным стилем",
    "Плавание на 500 м вольным стилем","Плавание на 100м способом брасс","Плавание в обмундировании с оружием"},

{"Баллы","Кол-во раз","Кол-во раз","Кол-во раз","Кол-во раз","Кол-во раз","Кол-во раз","Кол-во раз","Кол-во раз","секунд",
    "Кол-во раз","Кол-во раз","Кол-во раз","Кол-во раз","Кол-во раз","Кол-во раз","секунд","секунд","секунд","секунд","мин. с","мин. с","мин. с",
    "мин. с","мин. с","мин. с","метров","мин. с","мин. с","с","мин. с","мин. с","мин. с","метров"}}

local function sorter(id)
    
    
    dates={}
    bals={}
print (#base[1],#base[id] ,#dates, #bals)
        local j=1
    for i = 1,#base[id] do
        bals[j]=101-i
        dates[j]=base[id][i]
        if base[id][i]=="-" then 
            j=j-1
        end 
        j=j+1   
    end
 print (#base[1],#base[id] ,#dates, #bals)   
    return
end

function scene:create( event )
	local sceneGroup = self.view
    
    back.isVisible =true   

	local background = display.newImageRect(sceneGroup, "img/bg.jpg", cw, ch )
	background.x = cx
	background.y = cy

    local plus = display.newImageRect(sceneGR, "img/plus.png", 125, 125 )
    plus.x = 450
    plus.y = 850
    plus:addEventListener("touch", function(event) 
            if event.phase == 'ended' then 
                if sceneGR.isVisible==true then
                    buttonCreate(sila.text,nomBut)
                    sceneGR.isVisible = false
                    button1:setLabel(".....")
                    UprText.text="Выберите упражнение:"
                    SumBall.text=tonumber(SumBall.text)+tonumber(sila.text) 
                    nomBut=nomBut+1
                end
                
            end; end)

    local wid = display.newText(sceneGR, "", display.contentCenterX-130, 830, "font/font.ttf", 70 )

    local Ball = display.newText(sceneGroup, "Баллов:", cx-50, 60, "font/font.ttf", 90 )
    Ball:setFillColor( 1 )
    SumBall = display.newText(sceneGroup, "0", cx+100, 60, "font/font.ttf", 90 )
    SumBall:setFillColor( 1 )


    local buttons = widget.newButton(
    {
        label = "Таблица начисления\n          баллов",
        onEvent = function() system.openURL( "http://base.garant.ru/195845/f603ec606343c1e1c5b8202d7b04db95/" ); end,
        emboss = true,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 230,
        height = 70,
        cornerRadius = 10,
        fillColor = { default={0.7,0.7,0.9,0.4}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        x=display.contentCenterX-10,
        y = 910,
        fontSize =20,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
    }
)
local function iconListener( event )
    local id = event.target.id

    if ( event.phase == "moved" ) then
        local dx = math.abs( event.x - event.xStart ) 
        if ( dx > 5 ) or (dx<5) then
            scrollView:takeFocus( event ) 
        end
    elseif ( event.phase == "ended" ) then

        button1:setLabel( icons[id]:getLabel() )
        button1.fontsize=10

        if id==1 then sceneGR.isVisible = false else sceneGR.isVisible = true end

    sorter(id);
    local columnData1 = { 
        {
            align = "center",
            width = 200,
            startIndex = 1,
            labels = dates,
        },
    }

        timer.performWithDelay( 10, function()  
            widgetPWCreate(columnData1);
              UprText.text="Упражнение №"..data[1][id];
               scrollView:removeSelf(); 
               scrollView = nil;
               wid.text=data[3][id];
                end )
    
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
                
        for i = 1, #data[2] do
             
            
            local size=string.len(data[2][i])>40 and 32-math.round(string.len(data[2][i])/7) or 28
           local colour=( i%2==1) and 0.8 or 0.7
           local colour1=0
            icons[i] = widget.newButton(
                {
            label = data[2][i],
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
            y = 65*i,
            fontSize =size,
            labelColor = { default={ colour1,colour1,colour1 }, over={ 1, 0, 0, 0.5 } }
    }
)

            scrollView:insert( icons[i] )

        end
    end
    return true
end
    UprText = display.newText( ("Выберите упражнение:"), display.contentCenterX, 250, "font/font.ttf", 70 )
   

    button1 = widget.newButton({
        label = ".......",
        onEvent = showSlidingMenu,
        emboss = true,
        shape = "roundedRect",
        width = 500,
        height = 60,
        cornerRadius = 10,
        x=display.contentCenterX,
        y=320,
        fillColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        fontSize =30,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } } })
   
    
    label2 = display.newText(sceneGR, "результат   /   баллы ", display.contentCenterX, 410, "font/font.ttf", 70 )
    sila = display.newText(sceneGR, "0", 420, 550, "font/font.ttf", 150 )
    sceneGR.isVisible=false


    sceneGroup:insert( UprText )
    sceneGroup:insert( button1 )
    
end

function widgetPWCreate( ColumnData)
    local function pickerSelectionListener1( event )
    
   -- print( "Row1:", event.row )
    --sila.text=102-event.row
    sila.text=bals[event.row]
    end

     -- Create a new Picker Wheel
        pickerWheel1 = widget.newPickerWheel {
        columns = ColumnData,
        fontSize=50,
        fontColor = { 0.2, 0.2, 0.2 },
        style = "resizable",
        width = 200,
        Height = 400,
        rowHeight = 66,
        columnColor = { 0.8, 0.8, 0.8 },
    onValueSelected = pickerSelectionListener1,
}
    pickerWheel1.x = display.contentCenterX-130
    pickerWheel1.y = display.contentCenterY+150
   
local myRoundedRect2 = display.newRoundedRect( pickerWheel1.x, pickerWheel1.y, 220, 70, 12 )
        myRoundedRect2.strokeWidth = 5
        myRoundedRect2:setFillColor( 0,0,0,0.1 )
        myRoundedRect2:setStrokeColor( 1, 0, 0 )

    pickerWheel1:selectValue( 1,  math.round(#dates/2) ) 


   sceneGR:insert( pickerWheel1 )
   sceneGR:insert( myRoundedRect2 )
end

function buttonCreate(str,id)
    -- body
    button = widget.newButton(
    {
        label = str,
        id = "but"..id,
        emboss = true,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 100,
        height = 80,
        cornerRadius = 10,
        fillColor = { default={titleGradient}, over={0.7,0.7,0.9,0.4} },
        strokeColor = { default={0.7, 0.7, 0.7, 0.7}, over={0.7, 0.7, 0.7, 0.7} },
        strokeWidth = 5,
        x=125*id-40,
        y = 165,
        fontSize =32,
        labelColor = { default={  1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
    }
)
   -- sceneGR:insert( button )
end
function scene:key(event)

    if ( event.keyName == "back" ) or ("b"==event.keyName) then

          -- handle the back key press however you choose
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
	
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
        sceneGR.isVisible=false
		composer.removeScene("scene.calcpens", true)   
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		--composer.removeScene("scene.nfp", true)   
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end




-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
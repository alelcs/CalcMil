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


 kt=0 		--звание
 tb=0 		--должность, тарифный разряд
local kll = 0 	--класс лётчиков
local kbm=0 	--выслуга
dd=0		--составляющая ДД - оклад+звание

local kcc=0 	--надбавка за класс
local kbc=0 	--надбавка за секретку
local kcv=0		--ежемесячная надбавка за выполнение задач, непосредственно связанных с риском
local km=0		--надбавка за особые условия ВС
local kcpr=0 	--ежемесячная премия
local k=1.04 	--коэффициент прибавки
local kc = 0	--за достижения вс
local kcu = 0	--юридическое образование
local kbct = 0	--стаж в ЗГТ
local mes = 0	--район
local mes1 = 0	--северные
BD=0 --за боевое дежурство
	     pkll=0 --% летного класса
	     pr=0 --% от ОВД
	     dd=0 --ОДС оклад+звание
	     sa=0--надбавка за особые достижения в службе
	     su=0 --надбавка за юридическое образование
	     sd=0 --надбавка за условие вс
	     sx=0 --связанных рисками
	     sp=0 --ежемесячная премия
	     st=0 --стаж ПЗГТ
	     sv=0 --классность
	     sf=0 --секретка
	     me=0 --расчет районного коэффициента
	     me1=0 --рассчет в районах крайного севера
	     rez=0 --итого
	     rez6=0 --налог
         kbm1=0 -- надбавка за выслугу лет

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
local function summa()
	     pkll=kll/100+1 --% летного класса
	     pr=(tb*pkll/100) --% от ОВД
	     dd=(tb*pkll+kt) --ОДС оклад+звание
	     sa=pr*kc --надбавка за особые достижения в службе
	     su=pr*kcu --надбавка за юридическое образование
	     sd=pr*km --надбавка за особые условие вс
	     sx=pr*kcv --связанных рисками
	     sp=dd*kcpr/100 --ежемесячная премия
	     st=pr*kbct --стаж ПЗГТ
	     sv=pr*kcc --классность
	     sf=pr*kbc --секретка
         kbm1=(dd/100*kbm)
	     me=((dd+kbm1+sv+sf+sd+(BD*tb*pkll))/100)*mes --расчет районного коэффициента
	     me1=((dd+kbm1+sv+sf+sd+(BD*tb*pkll))/100)*mes1 --рассчет в районах крайного севера
	     
	     rez=dd+(dd/100*kbm)+sa+sd+sx+sp+st+sv+sf+su+me+me1+(BD*tb*pkll) --итого
	     
	     rez6=(rez)*13/100 --nalog

        babki.text=(math.round((rez)).."p.-13%="..math.round((rez-rez6)).."p.")
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
        if activ_data=="scene.base.kt" then
        button1:setLabel( icons[id]:getLabel() )
        kt=data[id].factor*k
    	end
		if activ_data=="scene.base.tb" then
        button2:setLabel( icons[id]:getLabel() )
        tb=data[id].factor*k
    	end
    	if activ_data=="scene.base.kll" then
        button22:setLabel( icons[id]:getLabel() )
        kll=data[id].factor
    	end
		if activ_data=="scene.base.kbm" then
        button3:setLabel( icons[id]:getLabel() )
        kbm=data[id].factor
    	end
		if activ_data=="scene.base.kcc" then
        button4:setLabel( icons[id]:getLabel() )
        kcc=data[id].factor
    	end
    	if activ_data=="scene.base.kbc" then
        button5:setLabel( icons[id]:getLabel() )
        kbc=data[id].factor
    	end
		if activ_data=="scene.base.km" then
        button6:setLabel( icons[id]:getLabel() )
        km=data[id].factor
    	end

    	if activ_data=="scene.base.kcpr" then
        button7:setLabel( icons[id]:getLabel() )
        kcpr=data[id].factor
    	end

		if activ_data=="scene.base.kbct" then
        button8:setLabel( icons[id]:getLabel() )
        kbct=data[id].factor
    	end

    	if activ_data=="scene.base.kcu" then
        button9:setLabel( icons[id]:getLabel() )
        kcu=data[id].factor
    	end
		if activ_data=="scene.base.kcv" then
        button10:setLabel( icons[id]:getLabel() )
        kcv=data[id].factor
    	end
    	if activ_data=="scene.base.kc" then
        button11:setLabel( icons[id]:getLabel() )
        kc=data[id].factor
    	end
    	if activ_data=="scene.base.mes" then
        button12:setLabel( icons[id]:getLabel() )
        mes=data[id].factor
    	end
    	if activ_data=="scene.base.mes1" then
        button13:setLabel( icons[id]:getLabel() )
        mes1=data[id].factor
    	end
    	if activ_data=="scene.base.BD" then
        button14:setLabel( icons[id]:getLabel() )
        BD=data[id].factor
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
    back.isVisible=true

print (cx,cy,cw,ch)

    local background = display.newImageRect( "img/bg.jpg", cw, ch )
    background.x = cx
    background.y = cy
    sceneGroup:insert( background )

	title = display.newText( "Ваша зарплата составляет:", display.contentCenterX+30, 50, "font/font.ttf", 65 )
	title:setFillColor( 1 )	-- white
	babki = display.newText( "0 p", display.contentCenterX, 120, "font/font.ttf", 80 )
	babki:setFillColor( 1 )	-- white

    
	details = display.newText( "п_о_д_р_о_б_н_е_е", display.contentCenterX, display.contentHeight-25, "font/font.ttf", 60 )
	details:setFillColor( 1 )
    details:addEventListener("touch", function(event)
    
            if event.phase == 'ended' then
              back.isVisible=false;
        composer.showOverlay("scene.result", {
				isModal = true,
				effect = "fade",
				time = 400,
			});
                 
            end
        end
    );
	sceneGroup:insert( details )
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
        height = 60,
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
        local text1=display.newText(options_text)
			text1.text="Оклад по воинскому званию:"
			text1:setFillColor( 0.2,0.7,0.3 )	-- white
			text1.y=20

		button1 = widget.newButton(options_button)
			button1:setLabel("Выберите воинское звание")
			button1.y=70
			button1.id="scene.base.kt"

	scrollView1:insert(text1)
	scrollView1:insert(button1)

		local text2=display.newText(options_text)
			text2.text="Оклад по воинскому должности:"
			text2:setFillColor( 0.2,0.7,0.3 )	-- white
			text2.y=140

		button2 = widget.newButton(options_button)
			button2:setLabel( "выберите воинскую должность")
        	button2.id = "scene.base.tb"
        	button2.y = 190,
 
	scrollView1:insert(text2)
	scrollView1:insert(button2)

		local text22=display.newText(options_text)
		text22.text="Надбавка за квалификационную категорию летному составу:"
		text22:setFillColor( 0.2,0.7,0.3 )	-- white
		text22.y=280

		button22 = widget.newButton(options_button)
		button22:setLabel( "укажите КК для летного состава")
        button22.id = "scene.base.kll"
        button22.y = 350,
 
	scrollView1:insert(text22)
	scrollView1:insert(button22)

		local lines = display.newLine( 10, 395, 520, 395 )
			lines:setStrokeColor( 1, 0, 0, 1 )
			lines.strokeWidth = 4
		scrollView1:insert(lines)

		local text3=display.newText(options_text)
			text3.text="Надбавка за выслугу лет:"
			text3:setFillColor( 0.2,0.7,0.3 )	-- white
			text3.y=420
		button3 = widget.newButton(options_button)
			button3:setLabel ("Укажите выслугу лет")
        	button3.id = "scene.base.kbm"
        	button3.y = 470
	scrollView1:insert(text3)
	scrollView1:insert(button3)

		local text4=display.newText(options_text)
			text4.text= "Надбавка за \n квалификационный класс:"
			text4:setFillColor( 0.2,0.7,0.3 )	-- white
			text4.y=560
		button4 = widget.newButton(options_button)
			button4:setLabel ("отсутствует")
        	button4.id = "scene.base.kcc"
        	button4.y = 630
	scrollView1:insert(text4)
	scrollView1:insert(button4)

		local text5=display.newText( options_text)
			text5.text="Надбавка за работу со сведениями, составляющими государственную тайну:"
			text5:setFillColor( 0.2,0.7,0.3 )
			text5.y=740
		button5 = widget.newButton(options_button)
			button5:setLabel ("отсутствует")
        	button5.id = "scene.base.kbc"
        	button5.y = 830
	scrollView1:insert(text5)
	scrollView1:insert(button5)

		local text6=display.newText( options_text)
			text6.text="Надбавка за особые условия военной службы:"
			text6:setFillColor( 0.2,0.7,0.3 )
			text6.y=920
		button6 = widget.newButton(options_button)
			button6:setLabel ("0%")
        	button6.id = "scene.base.km"
        	button6.y = 990
	scrollView1:insert(text6)
	scrollView1:insert(button6)

		local text7=display.newText( options_text)
			text7.text="Премия за добросовестное и эффективное исполнение должностных обязанностей:"
			text7:setFillColor( 0.2,0.7,0.3 )
			text7.y=1100
		button7 = widget.newButton(options_button)
			button7:setLabel ("0%")
        	button7.id = "scene.base.kcpr"
        	button7.y = 1190
	scrollView1:insert(text7)
	scrollView1:insert(button7)
		
		local text8=display.newText( options_text)
			text8.text="Надбавка за стаж работы в структурных ПЗГТ:"
			text8:setFillColor( 0.2,0.7,0.3 )
			text8.y=1280
		button8 = widget.newButton(options_button)
			button8:setLabel ("0%")
        	button8.id = "scene.base.kbct"
        	button8.y = 1350
	scrollView1:insert(text8)
	scrollView1:insert(button8)

		local text9=display.newText( options_text)
			text9.text="Надбавка в/с, имеющим высшее юридическое образование:"
			text9:setFillColor( 0.2,0.7,0.3 )
			text9.y=1440
		button9 = widget.newButton(options_button)
			button9:setLabel ("0%")
        	button9.id = "scene.base.kcu"
        	button9.y = 1510
	scrollView1:insert(text9)
	scrollView1:insert(button9)

		local text10=display.newText( options_text)
			text10.text="Надбавка за выполнение задач, связанных с риском для жизни и здоровья в мирное время:"
			text10:setFillColor( 0.2,0.7,0.3 )
			text10.y=1610
		button10 = widget.newButton(options_button)
			button10:setLabel ("0%")
        	button10.id = "scene.base.kcv"
        	button10.y = 1700
	scrollView1:insert(text10)
	scrollView1:insert(button10)

		local text11=display.newText( options_text)
			text11.text="Ежемесячная надбавка за особые достижения в службе,\n в т.ч. за ФИЗО:"
			text11:setFillColor( 0.2,0.7,0.3 )
			text11.y=1800
			
		button11 = widget.newButton(options_button)
			button11:setLabel ("0%")
        	button11.id = "scene.base.kc"
        	button11.y = 1890
	scrollView1:insert(text11)
	scrollView1:insert(button11)

		local lines1 = display.newLine( 10, 1935, 520, 1935 )
			lines1:setStrokeColor( 1, 0, 0, 1 )
			lines1.strokeWidth = 4
		scrollView1:insert(lines1)

		local text12=display.newText( options_text)
			text12.text="Районный коэффициент:"
			text12:setFillColor( 0.2,0.7,0.3 )
			text12.y=1960
		button12 = widget.newButton(options_button)
			button12:setLabel ("0%")
        	button12.id = "scene.base.mes"
        	button12.y = 2020
	scrollView1:insert(text12)
	scrollView1:insert(button12)

		local text13=display.newText( options_text)
			text13.text="Северная надбавка:"
			text13:setFillColor( 0.2,0.7,0.3 )
			text13.y=2080
		button13 = widget.newButton(options_button)
			button13:setLabel ("0%")
        	button13.id = "scene.base.mes1"
        	button13.y = 2130
	scrollView1:insert(text13)
	scrollView1:insert(button13)

		local lines2 = display.newLine( 10, 2170, 520, 2170 )
			lines2:setStrokeColor( 1, 0, 0, 1 )
			lines2.strokeWidth = 5
		scrollView1:insert(lines2)

		local text14=display.newText( options_text)
			text14.text="Премия за БД:"
			text14:setFillColor( 0.2,0.7,0.3 )
			text14.y=2200
		button14 = widget.newButton(options_button)
			button14:setLabel ("0%")
        	button14.id = "scene.base.BD"
        	button14.y = 2260
	scrollView1:insert(text14)
	scrollView1:insert(button14)

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
Runtime:addEventListener( "key", scene )
---------------------------------------------------------------------------------

return scene


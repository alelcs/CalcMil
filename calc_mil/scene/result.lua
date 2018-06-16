local composer = require("composer");
local widget = require("widget");
local json = require("json");

local scene = composer.newScene();
	
function scene:create(event)
	local sceneGroup = self.view;
	
	display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight):setFillColor(37/255, 39/255, 46/255, 0.9);
	
	local okButton = widget.newButton {
		shape = 'roundedRect',
		cornerRadius = 30,
		width = 440,	height = 65,
		left = 50, top = 890,
		fillColor = { default={ 0.7, 0, 0, 0.7 }, over={ 0, 149/255, 59/255 } },
		labelColor = { default={ 1 }, over={ 1 } },
		fontSize = 32,
		label = "OK",
		onPress = function(event)
			back.isVisible=true;
			composer.hideOverlay("fade", 400);
		end
	}
	sceneGroup:insert(okButton);
	
	scrollView = widget.newScrollView
        {
            width = display.contentWidth,
            height = 850,
            scrollWidth =  display.contentWidth,
            scrollHeight = 2500,
            horizontalScrollDisabled = true,
            hideBackground = true,
            listener = scrollListener
        }
	
        scrollView.x = display.contentCenterX
        scrollView.y = display.contentCenterY-50

        
	
	-- Выводим результаты
	------------------------------------------------------------------
local options_text = {  
		text="",
    	x = display.contentCenterX,
    	width = display.contentWidth,
    	font = native.systemFont,   
    	fontSize = 31,
    	align = "center"  }

	x=display.newText("Подробно:", display.contentCenterX, 40, "font/font.ttf", 80)
	
	x1=display.newText(options_text)
	x1.text="Оклад по воинскому званию \n\n\nОклад по воинcкой должности \n\n\nПремия ежем./ премия за ос. усл. \n\n\nКлассность / секретка \n\n\n"
	x1.y=300
	x2=display.newText(options_text)
	x2.text="Надбавка за выслугу лет \n\n\nРайонный коэффициента \n\n\nСеверная надбавка \n\n\nПремия за БД \n\n\nНалог 13% \n\n\nПодъемное пособие, мат помощь \n\n\nитого / итого-13%"
	
	x2.y=830

	x3=display.newText(options_text);
	x3.text=kt.."\n\n"..tb.."\n\n"..sp.." / "..sd.."\n\n"..sv.." / "..sf.."\n\n"..kbm1.."\n\n"..me.."\n\n"..me1.."\n\n"..
	math.round((BD*tb*pkll)).."\n\n"..rez6.."\n\n"..dd.."\n\n"..rez.." / "..math.round(rez-rez6)
	x3.size = 46
	x3.y=670
	x3:setFillColor( 0,1,0 )


scrollView:insert(x)
	scrollView:insert(x1)
	scrollView:insert(x2)
	scrollView:insert(x3)



sceneGroup:insert(scrollView)
	-- Сохраняем параметры
	------------------------------------------------------------------

end

scene:addEventListener("create", scene);
return scene;
	
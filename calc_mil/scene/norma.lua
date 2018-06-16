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
			numericField1.isVisible=true;
            numericField2.isVisible=true;   
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


sceneGroup:insert(scrollView)
	-- Сохраняем параметры
	------------------------------------------------------------------

end

scene:addEventListener("create", scene);
return scene;
	
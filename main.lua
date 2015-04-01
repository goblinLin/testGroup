-----------------------------------------------------------------------------------------
--
-- main.lua
-- 此範例用以介紹group這個功能的使用方式與時機
-- Author: Zack Lin
-- Time:2015/4/1
-----------------------------------------------------------------------------------------

--=======================================================================================
--引入各種函式庫
--=======================================================================================
display.setStatusBar( display.HiddenStatusBar )
local widget = require ("widget")
--=======================================================================================
--宣告各種變數
local numOfBtn = 5
local startOfX = 40
local startOfY = 40
local distanceBetweenBtns = 70
local btns

local initial
--=======================================================================================
_SCREEN = {
	WIDTH = display.viewableContentWidth,
	HEIGHT = display.viewableContentHeight
}
_SCREEN.CENTER = {
	X = display.contentCenterX,
	Y = display.contentCenterY
}

--=======================================================================================
--宣告與定義main()函式
--=======================================================================================
local main = function (  )
	btns = display.newGroup( )
	initial(btns)
end

--=======================================================================================
--定義其他函式
--=======================================================================================
initial = function (group)
	for i=1,numOfBtn do
		local btn = widget.newButton{
			width = 120,
	    	height = 60,
	    	defaultFile = "images/BackBtn.png",
	    	overFile = "images/BackBtnPressed.png",
		}
		btn.anchorX = 0
		btn.anchorY = 0
		btn.x = 0
		btn.y = (i - 1) * distanceBetweenBtns
		group:insert( btn )
	end
	group.x = startOfX
	group.y = startOfY
end
--=======================================================================================
--呼叫主函式
--=======================================================================================
main()
-- Your code here
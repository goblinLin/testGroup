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
local startOfX = 0
local startOfY = 10
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
	--生成一個新的子Group
	btns = display.newGroup( )
	initial(btns)
end

--=======================================================================================
--定義其他函式
--=======================================================================================
initial = function (group)
	group.x = startOfX
	group.y = startOfY

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

		--將生成的按鈕放進group群組當中
		group:insert( btn )

		--取得群組的子元件的全域座標
		local actual_x , actual_y = btn:localToContent( 0, 0 )
		print( 'actual_x:' .. actual_x ..",actual_y:" .. actual_y )
	end

	local image = display.newImageRect( group, "images/GameCenter.png", 80, 80)
	image.x = _SCREEN.WIDTH - 130
	image.y = 20
end
--=======================================================================================
--呼叫主函式
--=======================================================================================
main()

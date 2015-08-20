-----------------------------------------------------------------------------------------
--
-- main.lua
-- 此範例用以介紹group這個功能的使用方式與時機
-- Author: Zack Lin
-- Time:2015/8/18
-----------------------------------------------------------------------------------------
--[[  Group練習
	1.建立一個新Group1
	2.將一張圖片放進Group中，並調整Group的位置
	3.修改Group1的位置與anchor
	4.建立一個新的Group2，將Group1放進Group2當中
]]
--=======================================================================================
--引入各種函式庫
--=======================================================================================
display.setStatusBar( display.HiddenStatusBar )
-- 載入widget Library
local widget = require ("widget")
--=======================================================================================
--宣告各種全域變數
_SCREEN = {
	WIDTH = display.contentWidth,
	HEIGHT = display.contentHeight
}
_SCREEN.CENTER = {
	X = display.contentCenterX,
	Y = display.contentCenterY
}
--=======================================================================================
--宣告各種區域變數
local numOfBtn = 5
local startOfX = 40
local startOfY = 40
local distanceBetweenBtns = 70
local btns
--宣告各種區域函式
local initial
--=======================================================================================
--宣告與定義main()函式
--=======================================================================================
local main = function (  )
	-- 建立一個子群組
	btns = display.newGroup( )
	initial(btns)
end
--=======================================================================================
--定義其他函式
--=======================================================================================
--初始化函式，一般用於建立元件，設定初始值，部署元件等工作...
initial = function (group)
	print('initial')
	--Group同樣可以設錨點，但需要使用anchorChildren來觸發
	group.anchorX = 0
	group.anchorY = 0
	group.anchorChildren = true
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
		-- 將元件加入群組中
		group:insert( btn )
	end
	group.x = startOfX
	group.y = startOfY
end
--=======================================================================================
--呼叫主函式
--=======================================================================================
-- 先完成所有的宣告以及賦值，最後才執行main方法啟動工作
main()
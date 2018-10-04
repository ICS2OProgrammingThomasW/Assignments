-- Title: Displaying shapes in Lua
-- Name: Thomas Wehbi
-- Course: ICS20
-- this program diplays shapes in Lua
 
 local halfW = display.contentWidth * 0.5
 local halfH = display.contentHeight * 0.5
 local vertices = { 0,110, 65,90, -65,90 }
local triangle = display.triangle( HalfW, HalfH, vertices )

-- set the background color of my screen.Remember that colors are between 0 and 1
display.setDefault("background", 186/255, 196/255, 44/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the width of the border
myTriangle.strokeWidth = 20

-- set the color of the triangle 
myTriangle:setFillColor(0.4, 0.3, 0.2)

-- set the color of the border
myTriangle:setStrokeColor(1, 4, 2)

-- Draw the Triangle
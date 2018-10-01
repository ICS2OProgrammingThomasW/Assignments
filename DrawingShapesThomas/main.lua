-- Title: Displaying shapes in Lua
-- Name: Thomas Wehbi
-- Course: ICS20
-- this program diplays shapes in Lua


local halfW = display.contentWidth * 0.5

local halfH = display.contentHeight * 0.5
 
local vertices = { 0,110, 65,90, 65,90 }

local triangle = display.triangle( HalfW, HalfH, vertices )
triangle.fill = { type="image", filename="mountains.png" }
triangle.strokeWidth = 10






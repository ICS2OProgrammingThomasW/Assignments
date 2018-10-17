-----------------------------------------------------------------------------------------
-- Title: Animating Images
-- Name: Thomas Wehbi
-- Course: ICS2O
-- This program displays 3 images that move across the screen.

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

scrollSpeed = 3

local backgroundImage = display.newImageRect("Images/space.jpg", 2480, 1550)

print ("SPACE")

-- create a local variable
local textObject

-- set x,y locations of the text 
textObject = display.newText("space", 650, 650, nil, 50)

-- set the color of the text 
textObject:setTextColor(157/255, 97/255, 213/255)

-- add background with height and width
local backgroundImage = display.newImageRect("Images/space.jpg", 2480, 1550)

-- add background with height and width 
local astronaut = display.newImageRect("Images/astronaut.png", 350, 400)

local rocket2 = display.newImageRect("Images/rocket2.png", 350, 350)

local satellite = display.newImageRect("Images/satellite.png", 350, 400)

-- set the initial x and y positions of each image
astronaut.x = 130
astronaut.y = display.contentHeight/1.5

rocket2.x = 900
rocket2.y = display.contentWidth/2

satellite.x = 450
satellite.y = display.contentHeight/3




-----------------------------------------------------------------------------------------
-- Title: Animating Images
-- Name: Thomas Wehbi
-- Course: ICS2O
-- This program displays 3 images that move across the screen.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

local backgroundImage = display.newImageRect("Images/sapce.jpg", 2480, 1550)

-- add background with height and width
local backgroundImage = display.newImageRect("Images/space.jpg", 2480, 1550)

-- add background with height and width
local astronaut = display.newImageRect("Images/astronaut.png", 350, 400)

local rocket2 = display.newImageRect("Images/rocket2.png", 350, 350)

local satellite = display.newImageRect("Images/satellite.png", 350, 400)

--set the initial x and y positions of each image
astronaut.x = 130
astronaut.y = display.contentHeight/1.5

astronaut.x = 100
astronaut.y = display.contentWidth/2
rocket2.x = 900
rocket2.y = display.contentWidth/2

satellite.x = 450
satellite.y = display.contentHeight/3

--set this image to end transparent
--astronaut.alpha = 0
transition.to(astronaut,{x=270, y=450, time=12000})
transition.to(rocket2,{x=900, y=350, alpha=0, time=12000})
transition.to(satellite,{x=450, y=600, xScale=.3, yScale=.4, time=12000})
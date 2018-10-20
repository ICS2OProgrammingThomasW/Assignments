-----------------------------------------------------------------------------------------
-- Title: Animating Images
-- Name: Thomas Wehbi
-- Course: ICS2O
-- This program displays 3 images that move across the screen.

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- add background with height and width
-- Creating new variable and assigning it
local backgroundImage = display.newImageRect("Images/space.jpg", 2480, 1550)

-- add background with height and width 
local astronaut 
astronaut = display.newImageRect("Images/astronaut.png", 350, 400)

local rocket2 
rocket2 = display.newImageRect("Images/rocket2.png", 350, 350)

local satellite 
satellite = display.newImageRect("Images/satellite.png", 350, 400)

--set the initial x and y positions of each image

astronaut.x = 100
astronaut.y = display.contentWidth/2
rocket2.x = 900
rocket2.y = display.contentWidth/2

satellite.x = 450
satellite.y = display.contentHeight/3

--set this image to end transparent
--astronaut.alpha = 0
transition.to(astronaut,{x=270, y= 450, time=12000})
transition.to(rocket2,{x=900, y=350, alpha=0, time=12000})
transition.to(satellite,{ x= 450, y=600, xScale=.3, yScale=.4, time=12000})
-- transition.to(astronaut, {rotation=90})
-- transition.to(rocket2, {height = 700, time = 5000})
-- transition.to(satellite, {y = 850, delay = 5000, time = 6000})




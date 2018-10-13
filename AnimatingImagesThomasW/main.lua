-----------------------------------------------------------------------------------------
-- Title: Animating Images
-- Name: Thomas Wehbi
-- Course: ICS2O
-- This program displays 3 images that move across the screen.

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

--background image with width and height
local backgroundImage = display.newImageRect("Images/space.jpg", 2048, 1536)

-- character image with width and height
local astronaut = display.newImageRect("Images/astronaut", 200, 200)

-- set the image to be transparent
astronaut.alpha = 0

-- set the initial x and y position of space 
astronaut.x = 0
astronaut.y = display.contentHeight/3

-- function: MoveAstronaut
-- Input: this function accepts an event listener
-- output: none
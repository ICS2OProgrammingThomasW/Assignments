-----------------------------------------------------------------------------------------
-- CompanyLogoAnimation
-- Name: Thomas Wehbi
-- Course: ICS2O
-- Description: This program will display my clients on the screen that will move around etc.

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

counter = 0

-- sets the background color 
display.setDefault("background", 242/255, 5/255, 181/255)

-- Adding the Logo Image
local logo = display.newImageRect("Images/pumpkinSpiceLogo.png", 500, 500)

-- add border to logo
logo:setStrokeColor(0, 0, 0) 
logo.strokeWidth = 5

-- Logo X and Y
logo.x = 600
logo.y = display.contentHeight/2


local function moveLogo()
	logo.x = logo.x + math.random(-10,10)
	logo.y = logo.y + math.random(-10,10)
end

local function shrinkLogo()
	logo.width = logo.width * 0.99
	logo.height = logo.height * 0.99
end

local function increaseAlpha()
	logo.alpha = logo.alpha + 0.01
end

local function animateLogo() -- used some from internet
	counter = counter +1

	if (counter < 100) then
		increaseAlpha()
	elseif (counter < 200) then
		shrinkLogo()
	else
		moveLogo()
	end
end

logo.alpha = 0
timer.performWithDelay( 10, animateLogo, 300)










-----------------------------------------------------------------------------------------
-- Title: Math Quiz
-- Name: Thomas Wehbi
-- Course: ICS2O
-- Program: This program displays 3 hearts, if you get a question wrong you loose a life, if you run out of time you loose a life.
-- If you get three questions wrong, a game over image displays. If you get 5 questions right you win the game and a you win Image
-- displays.
-----------------------------------------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background color
display.setDefault("background", 95/255, 70/255, 215/255)

-- setting game stats
local points = 0
local secondsLeft = 10
local totalSeconds = 10
local lives = 3

-- randomNumber1 and randomNumber2 are used for all questions
local randomNumber1
local randomNumber2 	

-- randomOperator is used to determine the operation
local randomOperator

-- game ojbects 
local questionObject
local wrongObject
local correctObject
local clockText
local countDownTimer

--------------------------------------------------------------------
-- SOUNDS
--------------------------------------------------------------------

-- correctAnswer
local correctSound = audio.loadSound("Sounds/correctAnswer.wav" ) -- setting the variable to a wav file
local correctAnswerChannel

-- wrongAnswer
local wrongSound = audio.loadSound("Sounds/wrongAnswer.wav" ) -- setting the variable to a wav file
local wrongSoundChannel

-- looseGame 
local looseSound = audio.loadSound("Sounds/looseGame.mp3" ) -- setting the variable to an mp3 file
local looseGameChannel

-- winGame
local winGameSound = audio.loadSound("Sounds/winGame.wav" ) -- setting the variable to a wav file
local winGameChannel


------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
----------------------------------------------------------------------------------

local function hideAll()
	-- remove all texts from screen
	numericField.alpha = 0
	pointsText.isVisible = false
	questionObject.isVisible = false
	countDownTimer.isVisible = false
	heart1.isVisible = false
	heart2.isVisible = false
	heart3.isVisible = false
	correctObject.isVisible = false
	wrongObject.isVisible = false
end

local function LoseGame()
	hideAll()
	gameOver.alpha = 1
	looseGameChannel = audio.play(looseSound)
end

local function WinGame()
	hideAll()
	youWin.alpha = 1 
	winGameChannel = audio.play(winGameSound)
end 

local  function AskQuestion()	
	-- generate a random number for operator
	--   1 = +
	--   2 = -
	--   3 = *
	--   4 = /
	randomOperator = math.random(1,4)

	-- handle the case for addition
	if (randomOperator == 1) then

		--generate 2 random numbers between 1 and 20	
		randomNumber1 = math.random(1,20)
		randomNumber2 = math.random(1,20)

	   	correctAnswer = randomNumber1 + randomNumber2
	 	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = " 
	
	-- handle the case for subtraction, always substract smaller number from bigger number
	elseif (randomOperator == 2) then		
		--generate 2 random numbers between 1 and 20	
		randomNumber1 = math.random(1,20)
		randomNumber2 = math.random(1,20)

		-- if randomNumber1 is greater than randomNumber2 then subtract randomNumber2 from randomNumber1
		if (randomNumber1 > randomNumber2) then
			correctAnswer = randomNumber1 - randomNumber2 
			questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = " 
		-- else randomNumber2 is greater than randomNumber1 therefore subtract randomNumber1 from randomNumber2
		else
			correctAnswer = randomNumber2 - randomNumber1 
			questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = " 
		end
 	
 	--handle the case for multiplication	
	elseif (randomOperator == 3) then

		--generate 2 random numbers between 1 and 10	
		randomNumber1 = math.random(1,10)
		randomNumber2 = math.random(1,10)

 		correctAnswer = randomNumber1 * randomNumber2
	 	questionObject.text = randomNumber1 .. " * " .. randomNumber2.. " = " 
	

	-- handle the case for division, round to 1 decimal
	elseif (randomOperator == 4) then		
		--generate 2 random numbers between 1 and 100	
		randomNumber1 = math.random(1,100)
		randomNumber2 = math.random(1,100)

		correctAnswer = randomNumber1 / randomNumber2

		-- round to 1 decimal by * by 10, then flooring before diving by 10, must add 0.5 before flooring to round
	 	correctAnswer = math.floor(correctAnswer * 10 + 0.5) / 10
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = " 
  	 end

end

local function HideCorrect()
	correctObject.isVisible = false
end

local function HideWrong()
	wrongObject.isVisible = false
end


-- function that decreases the lives
local function DecreaseLives()	
	
	lives = lives -1	
	wrongSoundChannel = audio.play(wrongSound)

	if (lives == 3) then
		heart1.isVisible = true
		heart2.isVisible = true
		heart3.isVisible = true
	elseif (lives == 2) then
		heart1.isVisible = false
		heart2.isVisible = true
		heart3.isVisible = true
	elseif (lives == 1) then
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = true
	elseif (lives == 0) then 
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		LoseGame()
	end 

end
 
 -- call the function to ask a new question
local function NumericFieldListener(event)
		--user begind typing numericTextField
	if(event.phase == "began") then 					 		-- clear numericTextField
	elseif (event.phase == "submitted") then
		userAnswer = tonumber(event.target.text) 		-- submit the answer
		secondsLeft = totalSeconds						-- reset timer
		numericField.text = ""							-- reset numericField

		if( userAnswer == correctAnswer) then			-- user correct, answer correct
			points = points +1								-- +1 points
			pointsText.text = "Points : " ..points
			correctObject.text = "Correct"
			correctObject.isVisible = true					-- display correct answer
			correctAnswerChannel = audio.play(correctSound) -- SOUND
			if(points >= 5) then							-- winGame function
				WinGame()									-- winGame
			end
		
		timer.performWithDelay(2000, HideCorrect)		-- clear correct answer after 2 seconds delay

		else
			DecreaseLives()
			wrongObject.text = "Incorrect. The answer is " .. correctAnswer	-- if answer is wrong corrcet answer displays
			wrongObject.isVisible = true 									--Incorrect object is visible
			wrongSoundChannel = audio.play(wrongSound)
			
			timer.performWithDelay(2000, HideWrong)		-- clear wrong answer after 2 seconds delay

		end 

		AskQuestion()
	end
end 

	
local function UpdateTime()

	-- display the number of seconds left in the clock object
	secondsLeft = secondsLeft - 1

	clockText.text = secondsLeft .. ""

	if  (secondsLeft == 0) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		DecreaseLives()
		
	end

end

local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end
	 
----------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------

-- displays a question and sets the color 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(155/255, 80/255, 198/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

wrongObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
wrongObject:setTextColor(155/255, 183/255, 255/255)
wrongObject.isVisible = false


clockText = display.newText( secondsLeft, 412, 300, nil, 50)


pointsText = display.newText( "Points : " .. points, 112, 100, nil, 50)


gameOver = display.newImageRect("Images/gameOver.png", 800 ,800)
gameOver.x = display.contentCenterX
gameOver.y = display.contentCenterY
gameOver.alpha = 0

youWin = display.newImageRect("Images/YouWin.png", 800 ,800)
youWin.x = display.contentCenterX
youWin.y = display.contentCenterY
youWin.alpha = 0

-- create the lives to display on the screen 
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

-- create numeric field 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)

--the event listener for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener )

--------------------------------------------------------------------------
-- FUNCTION CALLS 
--------------------------------------------------------------------------

-- call the function to ask the question 

StartTimer()
AskQuestion()



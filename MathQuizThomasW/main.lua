-----------------------------------------------------------------------------------------
-- Title: Math Quiz
-- Name: Thomas Wehbi
-- Course: ICS2O
-- Program: This program displays 3 hearts, i fyou get a question wrong you loose a life, if you run out of time you loose a life.
-- If you get three questions wrong a game over image displays. If you get 5 questions right you win the game and a you win Image
-- displays.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)


-- set the background color
display.setDefault("background", 95/255, 70/255, 215/255)

local points = 0
local secondsLeft = 10
local totalSeconds = 10
local lives = 3
local questionObject
local x
local points = 5
local randomNumber1
local randomNumber2 
local randomNumber3 
local randomNumber4 	
local randomNumber5 
local randomOperator







--------------------------------------------------------------------
-- SOUNDS
--------------------------------------------------------------------

-- correctAnswer
local correctAnswer = audio.loadSound("Sounds/correctAnswer.wav" ) -- setting the variable to a wav file
local correctAnswerChannel

-- looseGame 
local looseGame = audio.loadSound("Sounds/looseGame.mp3" ) -- setting the variable to an mp3 file
local looseGameChannel

-- winGame
local winGame = audio.loadSound("Sounds/winGame.wav" ) -- setting the variable to a wav file
local winGameChannel

-- wrongAnswer
local wrongAnswer = audio.loadSound("Sounds/wrongAnswer.wav" ) -- setting the variable to a wav file
local wrongAnswerChannel

------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
----------------------------------------------------------------------------------

local  function AskQuestion()
	--generate 2 random numbers between a max. and a min. number
	
	randomNumber1 = math.random(1,20)
	randomNumber2 = math.random(1,20)
	randomNumber3 = math.random(1,10)
	randomNumber4 = math.random(1,10)		
	randomNumber5 = math.random(1,100)
	randomNumber6 = math.random(1,100)	
	randomOperator = math.random(1,7)

	-- handle the case for addition
	if (randomOperator == 1) then
		--calculate the correct answer
	   	correctAnswer = randomNumber1 + randomNumber2 
	 	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = " 
	elseif (randomOperator == 2 and (randomNumber1 > randomNumber2)) then
 		correctAnswer = randomNumber1 - randomNumber2 
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = " 
	elseif (randomOperator == 3 or randomOperator == 4) then
 		correctAnswer = randomNumber3 * randomNumber4
	 	questionObject.text = randomNumber3 .. " * " .. randomNumber4 .. " = " 
	elseif (randomOperator == 5 or randomOperator == 6) then
		-- used from internet 
 		correctAnswer = math.floor(randomNumber5 / randomNumber6)
	 	questionObject.text = randomNumber5 .. " / " .. randomNumber6 .. " = " 
	 	

  	 end
end


local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end


local function HideWrong()
	wrongObject.isVisible = false 
	AskQuestion()
end 

	

		-- function that decreases the lives
local function DecreaseLives()
end 
	
	if (secondsLeft == 0) then
		lives = lives -1

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
	end 
end
 -- call the function to ask a new question
 	

local function NumericFieldListener( event )
  
	-- when the answer is submitted (enter key is pressed) set user input to user's answer
	userAnswer = tonumber(event.target.text)

	-- if the users answer and the correct answer are the same:
	if (userAnswer == correctAnswer) then
		correctObject.isVisible = true

		-- 5 correct answers and you win the game, winGame image appears
			
		

		timer.performWithDelay(2000, HideCorrect)
		points = points +1

		correctSoundChannel = audio.play(correctSound)

		-- For each answer you get correct your points increase
		pointsTextObject.text = "points = " .. points 
		
		-- if the users answer and the correct answer are the same:
		-- call the funcion to decrease the lives
		lives = lives -1
		DecreaseLives()
		wrongObject.isVisible = true			
		timer.performWithDelay(2000, HideWrong)
		wrongSoundChannel = audio.play(wrongSound)
		
		
	-- WRONG
	else
		-- tells you "Incorrect" and the correct answer

		-- Sound plays

		--Loose a life

		-- Timer resets

		--loose all three lives GameOver Image appears
		event.target.text = ""
	
	end 


end 	

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1



	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""
	
	if (secondsLeft == 0) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives -1
		DecreaseLives() 
	end
end 
-- create a countdown timer that loops infinitely
 	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)


-- create a points box make it visible to see
pointsTextObject = display.newText(" points = " .. points, 300, 200, nil, 50 )
pointsTextObject:setTextColor(250/255, 250/255, 200/255)

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

clockText = display.newText(" Time Left = " .. secondsLeft, 412, 300, nil, 50)
-- Function Calls 

gameOver = display.newImageRect("Images/gameOver.png", 800 ,800)
gameOver.x = display.contentCenterX
gameOver.y = display.contentCenterY
gameOver.alpha = 0

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
AskQuestion()




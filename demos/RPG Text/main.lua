function love.load()
  background = love.graphics.newImage("/img/text background.png")
  character = love.graphics.newImage("/img/character.png")
  love.graphics.setNewFont(12)
  love.graphics.print(255,255,255)
  nextChar = 1
  elasped_time = 0
  wait_time = 0.05
  test_string = "Starting a game is easy. Finishing a game is hard. One Game A Month is a gamedev challenge where everyone's invited. Your quest is to create one game each month. "
end

function love.update(dt)
  --Get current passed time
  elasped_time = elasped_time + dt
  print(elasped_time)
  
  if elasped_time > wait_time then
    nextChar = nextChar + 3
    elasped_time = 0
  end
  
end

function love.draw()
  
  love.graphics.draw(background, 0,224 - 90)
  love.graphics.draw(character, 0,224 - 90)
  love.graphics.printf(string.sub(test_string,1, nextChar), 96, 224 - 86,224,"left")
end


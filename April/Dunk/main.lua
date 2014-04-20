require 'init'
require 'game'

function love.update(dt)
  
  if state == 'Menu' then
    updateMenu()
  elseif state == 'Game' then
    updateGame(dt)
  else
      --Error / Quit
  end
  
end

function love.draw()
	
    if state == 'Menu' then
    drawMenu()
  elseif state == 'Game' then
    drawGame()
  else
      --Error / Quit
  end
  
	--if love.keyboard.isDown("return") then
		--STATE = 1 --Move on to the game
	--else
		--love.graphics.print("The return key is down.", 50, 50)
	--end
	
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
end
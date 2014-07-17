require 'init'
require 'game'

function love.update(dt)
  
  if state == 'Menu' then
    updateMenu()
  elseif state == 'Game' then
    updateGame(dt)
  elseif state == 'Over' then
    updateOver()
  else
      --Error / Quit
  end
  
end

function love.draw()
	
    if state == 'Menu' then
    drawMenu()
  elseif state == 'Game' then
    drawGame()
  elseif state == 'Over' then
    drawOver()
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


--This Game is an Entry of Glitch Jam 2014, Hosted by Game Jolt(http://gamejolt.com/).

--Copyright (c) <2014> <Michael Redford>

--This software is provided 'as-is', without any express or implied warranty. In no event will the authors be held liable for any damages arising from the use of this software.

--Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

--1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.

--2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.

--3. This notice may not be removed or altered from any source distribution.
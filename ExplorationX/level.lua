
require 'ui.planet'

local levelRunning = false

currentLevel = "1-1"

function initLevel()
  btnLExit = button:new()
  btnLPlay = button:new()
  btnLExit:load(200,500,"/ui/menu/exit.png")
  btnLPlay:load(700,500,"/ui/menu/play.png")
  
  plnUno = planet:new(300,400,"/ui/level/planet1.png")
  plnDos = planet:new(300,200,"/ui/level/planet1.png")
  levelRunning = true
end

function updateLevel(dt)
  if levelRunning == false or levelRunning == nil then initLevel() end
  if btnLExit:clicked() then return "menu" end
  if btnLPlay:clicked() then return "game" end
  
  
  plnUno:update(dt)
  plnDos:update(dt)
  
  return "level"
end

function drawLevel()
  
  btnLExit:draw()
  btnLPlay:draw()
  
  plnUno:draw()
  plnDos:draw()
  return "level"
end

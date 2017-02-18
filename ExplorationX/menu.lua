
local menuRunning = false
btnPlay, btnOptions, btnExit = nil

function initMenu()
  btnPlay =  button:new()
  btnOptions =  button:new()
  btnExit =  button:new()

  btnPlay:load(200,0,"/ui/menu/play.png")
  btnOptions:load(200,200,"/ui/menu/options.png")
  btnExit:load(200,400,"/ui/menu/exit.png")
  menuRunning = true
end

function updateMenu(dt)
  if menuRunning == false or menuRunning == nil then initMenu() end
  
  love.graphics.setFont(love.graphics.newFont(48))
  love.graphics.setBackgroundColor(0,0,0)
  --love.graphics.setColor(0, 0, 0)
  
  if btnExit:clicked() then return "exit" end
  if btnOptions:clicked() then return "options" end
  if btnPlay:clicked() then return "level" end
  if love.keyboard.isDown('space') then return "menu" end
  return "menu"
end

function drawMenu()
  love.graphics.print("Explorer X", 100, 100)
  btnPlay:draw()
  btnOptions:draw()
  btnExit:draw()
  return "menu"
end
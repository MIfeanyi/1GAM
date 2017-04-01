--[[
game needs to take parameters for each level. button in level can trigger a levelload state
ex: if btnLevel1.Clicked() then currentLevel("1-1") return "game" end
in game.lua:
initGame() -- call initLevel() -- loads, waves, dificulty, maxEnemies, & the background image
game = initLevel() -- returns table of above functions
game needs to manage when it's time to spawn enemy waves
in update:
default time to spawn next wave is 2 minutes divided by dificulty wave/spawn manager
I need to track if there are any enemies left ( or if the table is empty) aka level beat
I need to track if the base has been destroyed aka lost
I need to check bullet collision for damage ( bullets vs players vs enemies)
(build buttons)
add currency
sound
TODO: Saving
]]


require 'gamestate'
gameRunning = false

game = {running = false, img, currentWave = 1, waves = 2, dificulty = 1, maxEnemies = 20, spawned = 0}

mouseUp = false -- used to check if mouse is up
function game:set()
  if currentLevel == "1-1" then
    self.currentWave, self.dificulty, self.maxEnemies, self.spawned = 1,1,20,0
  end
end
function game:spawn() --TODO replace random with window width
  if self.spawned <= self.maxEnemies then
    if (self.maxEnemies/2 + self.spawned) <= self.maxEnemies then
      for i=1,self.maxEnemies/2,1 do 
        addEnemy(math.random(1,800),-50,"/img/tank.png",1,3,30,true,"ship") 
      end
      self.spawned = self.maxEnemies/2 + self.spawned
    else 
      for i=1,self.maxEnemies-self.spawned,1 do
        addEnemy(math.random(1,400),-50,"/img/tank.png",1,3,30,true,"tank") 
      end
      self.spawned = self.maxEnemies-self.spawned + self.spawned
    end
  end
end
function initGame()

  btnTank = button:new() btnTank:load(400,500,"/img/tank.png")
  btnExit = button:new() btnExit:load(200,500,"/ui/menu/exit.png")
  print(currentLevel)
  print("setting up game")
  gameRunning = true
  placeUnit = false
  currentUnit = "cannon"
end


function game:update(dt)
  waveManager:update(dt)
  if waveManager.nextWave then game:spawn() waveManager:reset() end

  if gameRunning == false then initGame() end
  for i, enem in ipairs(enemies) do
    enem.y = enem.y + enem.speed*dt
  end

  if btnExit:clicked() then return "menu" end

  if love.mouse.isDown(1) == false then 
    mouseUp = true
  end
  if love.mouse.isDown(1) and placeUnit and btnTank:hover() == false then --TODO: Find some way to wait a few and check
    print("placing unit.")
    addPlayer(love.mouse.getX(), love.mouse.getY(), 3, 1, 5, 50, true, "tank")
    placeUnit = false
    mouseUp = false
  end

  if btnTank:clicked() then
    placeUnit = true
    currentUnit = "cannon"
    print("button clicked")
  end

  if love.keyboard.isDown('w') then
    for i, ply in ipairs(units) do
      print("Unit:",i,"X:",ply.x,"Y:",ply.y)
    end
  end


  return "game"
end

function game:draw()
  if gameRunning then
    drawEnemy()
    drawPlayer()

    btnExit:draw()
    btnTank:draw()
  end
  return "game"
end

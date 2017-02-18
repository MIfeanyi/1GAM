units = {}
enemies = {}

enemy = {x,y,img, bullets, recharge, speed = 5, alive = true}

player = {x,y,img,hp = 3, bullets, recharge, cost, alive = true}

--Rewrite
function addEnemy(x,y,file, bullets, recharge, speed, alive, unit)
  newEnemy = {x = x,y = y, img = img, bullets = bullets, recharge = recharge, speed = speed, alive = true, unit = unit}

  if newEnemy.unit == "tank" then newEnemy.img = love.graphics.newImage("/img/tank.png")
  elseif newEnemy.unit == "ship" then newEnemy.img = love.graphics.newImage("/img/ship.png")
  else newEnemy.img = love.graphics.newImage("/img/monster.png") end
  table.insert(enemies,newEnemy)
end

function drawEnemy()
  for i, enem in ipairs(enemies) do
    love.graphics.draw(enem.img,enem.x,enem.y) end
  end

  function addPlayer(x,y,hp, bullets, recharge, cost, alive, unit)
    newPlayer = {x=x,y=y,img,hp=hp, bullets=bullets, recharge=recharge, cost=cost, alive = true}
    if unit == "tank" then
      newPlayer.img = love.graphics.newImage("/img/tank.png")
      print("setting tank as player")
    elseif unit == "ship" then
      newPlayer.img = love.graphics.newImage("/img/ship.png")
      print("setting ship as player")
    else 
      newPlayer.img = love.graphics.newImage("/img/monster.png")
      print("default image unit:",unit,alive)
      end
    table.insert(units,newPlayer)

    --print("new player, x:",newPlayer.x,"y:",newPlayer.y,"source: ", newPlayer.img)

  end

  function drawPlayer()
    for j, ply in ipairs(units) do
      love.graphics.draw(ply.img,ply.x,ply.y) end
    end



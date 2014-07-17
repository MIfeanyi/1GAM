require 'collision' --Our collision function
  
function updateMenu()
  
  counter = 0
  
  if love.keyboard.isDown("return") then
      state = 'Game'
  end
  
end

function drawMenu()
  
  
  love.graphics.print("Game or Rage",width/2 + math.random(1,20),height/4 + math.random(1,20))
  
  
  love.graphics.print("Press Enter",width/2,height/4*2)
end

function updateGame(delta)
  
  --Movement
  if love.keyboard.isDown("left") then
  playerX = playerX - playerSpeed * delta
  playerFacing = 'left'
  end
  if love.keyboard.isDown("right") then
    playerX = playerX + playerSpeed * delta
    playerFacing = 'right'
  end
  if love.keyboard.isDown("up") then
  playerY = playerY - playerSpeed * delta
  end
  if love.keyboard.isDown("down") then
    playerY = playerY + playerSpeed * delta
  end
  
  --Fighting
  if love.keyboard.isDown(" ") then
    playerPunching = true
    --Run punch animation
    --If enemy stabbed
    if collisionCheck(playerX,playerY,32,64,enemyX,enemyY,32,64) == true then
      if(playerX < enemyX) then
        enemyX = enemyX + knifeDamage * enemySpeed * delta
      elseif(playerX > enemyX + 32) then
      enemyX = enemyX - knifeDamage * enemySpeed * delta
    end
  end
  end
  
  if(playerPunching == true) then
    playerPunchAnim:update(delta)
    end
  
  --Boundries
  if playerX > 832 then
    playerX = 800
  end
  if playerX < 0 then
    playerX = 0
  end
  
  if playerY > 664 then
    playerY = 600
  end
  if playerY < 200 then
    playerY = 200
  end
  
  
  --Updating knife
  if kSpawn == false then
    knifeY = 200 + math.random(1,400)
    knifeX = math.random(1,800-32)
    kSpawn = true
  end
  
  --Checking collision
  if collisionCheck(playerX,playerY,32,64,knifeX,knifeY,32,32) == true then
    playerEquiped = true -- Makes player stronger
    knifePickedUp = true -- knife is now not shown
  end
  
  --Move AI
  if enemyX < playerX then
    enemyX = enemyX + enemySpeed * delta
  elseif enemyX > playerX + 32 then
    enemyX = enemyX - enemySpeed * delta
  end
  if enemyY < playerY then
    enemyY = enemyY + enemySpeed * delta
  elseif (enemyY > playerY + 32) then
    enemyY = enemyY - enemySpeed * delta
  end
  
  --Attacks
  
  --TODO
  --AI

end

function drawGame()
  
  love.graphics.draw(background,0,0)
  
  if knifePickedUp == false then
    love.graphics.draw(knife,knifeX,knifeY)
  end
  
  if(playerPunching == true) then
    playerPunchAnim:draw(playerX,playerY)
  else
    love.graphics.draw(playerImage,playerX,playerY)
end

  love.graphics.draw(enemy,enemyX,enemyY)

  --Check if animations are done
  if(playerPunchAnim:getCurrentFrame() == 2) then
    playerPunching = false
  end
  
end

function updateOver()
  
end

function drawOver()
  
end
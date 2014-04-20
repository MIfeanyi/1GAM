
function updateMenu()
  if love.keyboard.isDown("return") then
    state = 'Game'
  end
  
end

function drawMenu()
  love.graphics.print("Press Enter to play",width/2,height/2)
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
  
  --Boundries
  if playerX + 64 > 800 then
    playerX = playerX - playerSpeed * delta
  end
  if playerX < 0 then
    playerX = playerX + playerSpeed * delta
  end
  
  --Attacks
  
  --TODO
  --AI

end

function drawGame()
  
  
  --love.graphics.draw(image,0,0)
  love.graphics.draw(background,0,0)
  
  love.graphics.draw(playerStand,playerX,playerY)
  
  --love.graphics.draw(playerImage,playerX,playerY)
end

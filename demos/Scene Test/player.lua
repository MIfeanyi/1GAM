--player
--TODO: add player animations.
local anim8 = require 'anim8'

-- init animation
local animation

player = {
  quad,
  x = 600,
  y = 300,
  w = 64,
  h = 64,
  scale = 1,
  speed = 50,
  direction = -1, -- -1 = left, 1 = right
  img = love.graphics.newImage("/img/player.png"),
  moving = false,
  hurt = false,
  jumping = false,
  dead = false,
  aWalking = nil,
  aStanding = nil,
  aHurt = nil,
  aJumping = nil,
  aDead = nil,
  aShoot = nil
  
}
--Animations loaded
local g = anim8.newGrid(32, 32, player.img:getWidth(), player.img:getHeight())
player.aWalking = anim8.newAnimation(g('1-3',1), 0.15)

player.quad = love.graphics.newQuad(0,0, 64, 64, player.img:getWidth(), player.img:getHeight()) 

player.img:setFilter('linear','nearest') -- no blurry sprites while scaling

function player.face(direction)
  if direction == "right" then
    player.direction = 1
  end
  if direction == "left" then
    player.direction = -1
    end
  end

function player.move(x,y,dt)

  if player.x > x then
    player.x = player.x - player.speed*dt
    if player.x - x <= -1 then -- correct for dt
      player.x = x
    end

  end
  if player.x < x then
    player.x = player.x + player.speed*dt
    if x - player.x  <= 1 then
      player.x = x
    end
  end

  if player.y > y then
    player.y = player.y - player.speed*dt
        if player.y - y <= -1 then -- correct for dt
      player.y = y
    end
  end
  if player.y < y then
    player.y = player.y + player.speed*dt
        if y - player.y  <= 1 then
      player.y = y
    end
  end



  if player.x == x and player.y == y then
    return true
  end

  return false
end

function player.draw()
  --love.graphics.draw(player.img, player.x, player.y)
  player.aWalking:draw(player.img,player.x, player.y,0,player.scale*player.direction,player.scale)
end
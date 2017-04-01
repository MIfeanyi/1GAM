require "camera"
require "player"
local bump = require "bump"
local sti = require("sti")



function love.load()

  --TODO: MOVE to player function
  hero.x= love.graphics.getWidth() / 2
  hero.y = love.graphics.getHeight() / 2
  hero.quad = love.graphics.newQuad(0,0, 64, 64, hero.img:getWidth(), hero.img:getHeight()) 



  --MAP
  map = sti("Town.lua", {"bump"},0,0)
  --love.physics.setMeter(32)
  world = bump.newWorld()
  map:bump_init(world)
  world:add(hero, hero.x,hero.y, hero.w, hero.h)

end


function love.update(dt)


  --MOVEMENT
  if love.keyboard.isDown('up','w') then
    hero.y = hero.y - (100*dt)
    if hero.y <= 0 then
      hero.y = 0
    end

    if hero.pos == 1 then
      hero.pos = 2
      hero.quad:setViewport(64,0,64,64)
    end
  end
  if love.keyboard.isDown('down','s') then
    hero.y = hero.y + (100*dt)
    if hero.y >= camera.map_h - 64 then
      hero.y = camera.map_h - 64 
    end
    if hero.pos == 2 then
      hero.pos = 1
      hero.quad:setViewport(0,0,64,64)
    end
  end
  if love.keyboard.isDown('left','a') then
    hero.x = hero.x - (100*dt)
    if hero.x <= 0 then
      print("Camera X: ", camera.x)
      hero.x = 0
    end

  end
  if love.keyboard.isDown('right','d') then
    hero.x = hero.x + (100*dt)
    if hero.x >= camera.map_w -64 then
      hero.x = camera.map_w -64
    end
  end

  local actualX, actualY, cols, len = world:move(hero, hero.x,hero.y)
  hero.x, hero.y = actualX, actualY
-- prints "Attempted to move to 0,64, but ended up in 0,-32 due to 1 collisions"
  if len > 0 then
    print(("Attempted to move  but ended up in %d,%d due to %d collisions"):format(actualX, actualY, len))
  else
    print("Moved player to (",hero.x,",",hero.y, ") no issues.")
  end


  --world:move(hero,hero.x,hero.y)
  camera.follow(hero.x,hero.y)
  map:update(dt)

end


function love.draw()
  love.graphics.translate(camera.x,camera.y)

  map:setDrawRange(-camera.x,-camera.y, love.graphics.getWidth(), love.graphics.getHeight())
  map:draw()
  map:bump_draw(world)
  love.graphics.draw(hero.img,hero.quad, hero.x,hero.y)
end


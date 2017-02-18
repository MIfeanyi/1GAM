--Camera module

world = {
  x = 0,
  y = 0,
  speed = 50,
  sensitivity = 100,
  w = love.graphics.getWidth(),
  h = love.graphics.getHeight(),
  map_w = 40*32,
  map_h = 30*32
}

function world.follow(x,y)
  --MOVE Camera

  if x < 0 + love.graphics.getWidth() / 2 then
    world.x = 0
  elseif x > world.map_w - love.graphics.getWidth()/2   then
    world.x = -(world.map_w - love.graphics.getWidth())
  else
    world.x = -(x - love.graphics.getWidth() / 2)
  end

  if y < 0 + love.graphics.getHeight() / 2 then
    world.y = 0
  elseif y > world.map_h - love.graphics.getHeight()/2   then
    world.y = -(world.map_h - love.graphics.getHeight())
  else
    world.y = -(y - love.graphics.getHeight() / 2)
  end

  --print("camera x: ",camera.x)
  --print("camera y: ",camera.y)
  --print("player x: ",x)
  --print("player y: ",y)

end

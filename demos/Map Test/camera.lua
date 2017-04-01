--Camera module

camera = {
  x = 0,
  y = 0,
  speed = 50,
  sensitivity = 100,
  w = love.graphics.getWidth(),
  h = love.graphics.getHeight(),
  map_w = 40*32,
  map_h = 30*32
}

function camera.follow(x,y)
  --MOVE Camera

  if x < 0 + love.graphics.getWidth() / 2 then
    camera.x = 0
  elseif x > camera.map_w - love.graphics.getWidth()/2   then
    camera.x = -(camera.map_w - love.graphics.    getWidth())
  else
    camera.x = -(x - love.graphics.getWidth() / 2) 
  end

  if y < 0 + love.graphics.getHeight() / 2 then
    camera.y = 0
  elseif y > camera.map_h - love.graphics.getHeight()/2   then
    camera.y = -(camera.map_h - love.graphics.getHeight())
  else
    camera.y = -(y - love.graphics.getHeight() / 2) 
  end

  --print("camera x: ",camera.x)
  --print("camera y: ",camera.y)
  --print("player x: ",x)
  --print("player y: ",y) 
  
end

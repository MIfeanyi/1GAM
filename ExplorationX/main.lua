require 'state'

function love.load() 
  state:switchState("menu")
end

function love.update(dt)
  state.update(dt)
end

function love.draw()
  state.draw()
end

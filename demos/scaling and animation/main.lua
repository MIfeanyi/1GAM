local anim8 = require 'anim8'
require 'player'

local animation
function love.load()
  hero.image = love.graphics.newImage("/graphics/player.png")
  hero.image:setFilter('linear','nearest')
  local g = anim8.newGrid(16, 16, hero.image:getWidth(), hero.image:getHeight())
  animation = anim8.newAnimation(g('1-3',1), 0.15)

end

function love.update(dt)
  animation:update(dt)
end



function love.draw()
    love.graphics.print('Hello World!', 400, 300)
    animation:draw(hero.image,100,0,0,5,5)
    love.graphics.setColor(0,0,0,0)
end
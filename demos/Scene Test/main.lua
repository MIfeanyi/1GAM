
--
require 'player'
require 'sound'
require 'title'
require 'level1'

worldCase = "title"

function love.load()

end

function love.update(dt)

  if worldCase == "Level1" then
    level1(dt,"update")
  end
  if worldCase == "title" then
    worldCase= updateTitle(dt,"")
  end


end

function love.draw()
   if worldCase == "title" then
    drawTitle()
  end 
    if worldCase == "Level1" then
    drawScene1()
  end
end

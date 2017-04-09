local state = {}
require("scene1")

function state:new()
	return lovelyMoon.new(self)
end

function state:load()
	scene1:run()
end

function state:close()
	
end

function state:enable()
	
end

function state:disable()
	
end

function state:update(dt)
	if scene1.done ==false then
		scene1:update(dt)
	else
	end
end

function state:draw()
	if scene1.done ==false then
		scene1:draw()
	else
	love.graphics.print("Done",0,0)
	end
end

function state:keypressed(key, unicode)
	
end

function state:keyreleased(key, unicode)
	
end

function state:mousepressed(x, y, button)
	
end

function state:mousereleased(x, y, button)
	
end

return state
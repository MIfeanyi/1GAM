
planet = class("planet", { x,y,r = 0, img})

function planet:init(x,y,filename)
  self.x,self.y,self.img = x,y,love.graphics.newImage(filename)
end

function planet:update(dt, rotation)
  if rotation ~= nil then
    self.r = self.r + (rotation*dt)
  else
    self.r = self.r + (0.05*dt)
  end

end

function planet:draw()
  love.graphics.draw(self.img, self.x, self.y, self.r,1,1,self.img:getHeight()/2, self.img:getWidth()/2) --TODO rotate
end



transitions= {
    queue = {},
    fade = {
        speed = 0,
        x,y
    },
    slide = {
        speed = 0
    },
    color = {r=0,b=0,g=0,a=0}
}

function transitions:addFade()
end

function transitions:addSlide()
end

function transitions:update()
end

function transitions:draw()
end

function transitions:fade:reset(direction)
    self.x,self.y = 0,0
end

function transitions:slide:update(direction,dt)
    local height, width = love.graphics.getHeight(),love.graphics.getWidth()
    if direction == "right" then
        self.x = self.x + self.speed*dt
        if self.x >= width then
            return true
        end
    elseif direction == "left" then
        self.x = self.x + self.speed*dt
        if self.x <= 0 then
            return true
        end
    elseif direction == "up" then
        self.y = self.y - self.speed*dt
    elseif direction == "down" then
        self.y = self.y + self.speed*dt
    end
end


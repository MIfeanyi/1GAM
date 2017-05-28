
transitions= {
    queue = {},
    fade = {
        speed = 0, 
    },
    slide = {
        speed = 0,
        x,y
    },
    color = {r=255,b=0,g=0,a=255},
    x =0,y=0,h=love.graphics.getHeight(),w=love.graphics.getWidth(),
    reset = false
}
function transitions:isEmpty()
    for _, _ in ipairs(self.queue) do
        return false
    end
    return true
end

function transitions:addFade(action,color,speed)
end

function transitions:addSlide(direction,color,speed)
    newSlide ={direction=direction,color=color,speed=speed}
    table.insert(self.queue,newSlide)
end

function transitions:update()
end

function transitions:draw()
    love.graphics.setColor(self.color.r,self.color.g,self.color.b,self.color.a)
    love.graphics.rectangle("fill", self.x, self.y,self.w,self.h)
    love.graphics.setColor(255,255,255,255)
end

function transitions.fade:reset(direction)
    self.x,self.y = 0,0
end

function transitions.slide:update(dt)
    local height, width = love.graphics.getHeight(),love.graphics.getWidth()
    local queue = transitions.queue
    if queue[1] ~= nil and transitions:isEmpty() == false then
        if queue[1].color ~= nil then
            transitions.color = queue[1].color
        end
        if queue[1].direction == "right" then
            if transitions.reset == false then
                transitions.x, transitions.y = -width,0
                transitions.h, transitions.w = love.graphics.getHeight(),love.graphics.getWidth()
                transitions.reset = true
            end
            transitions.x = transitions.x + queue[1].speed*dt
            if transitions.x + width >= width then
                transitions.w = transitions.w - queue[1].speed*dt
                if transitions.w <= 0 then
                    transitions.reset = false
                    table.remove(queue,1)
                    return true
                end
            end
        elseif queue[1].direction == "left" then
            if transitions.reset == false then
                transitions.x, transitions.y = width,0
                transitions.h, transitions.w = love.graphics.getHeight(),love.graphics.getWidth()
                transitions.reset = true
            end
            transitions.x = transitions.x - queue[1].speed*dt
            if transitions.x <= 0 then
                transitions.w = transitions.w - queue[1].speed*dt
                if transitions.w <=0 then
                    transitions.reset = false
                    table.remove(queue,1)
                    return true
                end
            end
        elseif queue[1].direction == "up" then
            if transitions.reset == false then
                transitions.x, transitions.y = 0,height
                transitions.h, transitions.w = love.graphics.getHeight(),love.graphics.getWidth()
                transitions.reset = true
            end
            transitions.y = transitions.y - queue[1].speed*dt
            if transitions.y <= 0 then
                transitions.h = transitions.h - queue[1].speed*dt
                if transitions.h <=0 then
                    transitions.reset = false
                    table.remove(queue,1)
                    return true
                end
            end
        elseif queue[1].direction == "down" then
            if transitions.reset == false then
                transitions.x, transitions.y = 0,-height
                transitions.h, transitions.w = love.graphics.getHeight(),love.graphics.getWidth()
                transitions.reset = true
            end
            transitions.y = transitions.y + queue[1].speed*dt
            if transitions.y + height >= height then
                transitions.h = transitions.h - queue[1].speed*dt
                if transitions.h <=0 then
                    transitions.reset = false
                    table.remove(queue,1)
                    return true
                end
            end
        end
    end
    return false
end


require 'image'
local animate = require 'lib.anim8'

sprite = {
    sprites={},
    queue={},
    movement = {}
}

function sprite:isEmpty()
    for _, _ in ipairs(self.queue) do
        return false
    end
    return true
end
function sprite:addSprite(id,x,y)
    newSprite = {id=id,aId,animations={},x=x,y=y}
    table.insert(self.sprites,newSprite)
end

function sprite:move(action,id,x,y,pause)
    newMove = {action=action,id=id,x=x,y=y,pause}
    table.insert(self.queue,newMove)
end

function sprite:addAnimation(sId,img,h,w,frames,id,speed,pause)
    local g = animate.newGrid(h,w,getImage(img):getWidth(),h)
    local newAnimation = animate.newAnimation(g(frames,1),speed)
    newAnimation.id = id
    newAnimation.img = img
    if pause == true then newAnimation:pauseAtEnd() end
    for i, s in ipairs(self.sprites) do
        if s.id == sId then
            table.insert(s.animations,newAnimation)
            break
        end
    end
  return newAnimation
end

function sprite:change(sId,aId)
    newChange = {action="change",sId=sId,aId=aId}
    table.insert(self.queue,newChange)
end

function sprite:changeAnim(sId,aId)
    for i, s in ipairs(self.sprites) do
        if s.id == sId then
            s.aId = aId
            break
        end
    end
end

function sprite:update(dt)
    for i, s in ipairs(self.sprites) do
        for j, a in ipairs(s.animations) do
            a:update(dt)
        end
    end
end

function sprite:updateQ(dt)
    if self.queue[1] ~= nil and self:isEmpty() == false then
        q=self.queue[1]
        if self.queue[1].action == "change" then
            sprite:changeAnim(q.sId,q.aId)
            table.remove(self.queue,1)
            return true
        end
    end
    return false
end

function sprite:draw()
    for i, s in ipairs(self.sprites) do
        for j, a in ipairs(s.animations) do
            if s.aId == a.id then
                a:draw(getImage(a.img),s.x,s.y)
                break
            end
        end
    end
end
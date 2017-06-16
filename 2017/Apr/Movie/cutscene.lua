
require("sprite")
require("sound")
require("dialog")
require("transitions")

cutScene = {
    queue= {}, --item={id="draw",pause=false}
    background = {set= false,id=nil,ox,oy}
}
function cutScene:isEmpty()
    for _, _ in ipairs(self.queue) do
        return false
    end
    return true
end

function cutScene:push(id,pause)
    newAct = {id=id,pause=pause}
    table.insert(self.queue,newAct)
end

function cutScene:pop(id)
    for i, a in ipairs(self.queue) do
        if a.id == id then
            table.remove(self.queue,i)
        end
    end
end

function cutScene:wait()
    self:push("wait",true)
end

function cutScene:addDialog(text,imgID,pause,size)
    self:push("dialog",pause)
    dialog:push("dialog",text,imgID,size)
end

function cutScene:Audio(id,action)
    self:push("sound",false)
    sound:push(id,action)
end

function cutScene:changeAnim(sId,aId)
    self:push("sprite",false)
    sprite:change(sId,aId)
end

function cutScene:slide(direction,color,speed)
    self:push("slide",true)
    transitions:addSlide(direction,color,speed)
end

function cutScene:moveSprite(id,x,y,speed,pause)
    self:push("move",pause)
    sprite:addMove(id,x,y,speed,pause)
end

function cutScene:update(dt)
    --call manager functions
    if self.queue ~= nil and self:isEmpty() == false then --items in queue
        if self.queue[1].id == "dialog" then
            if dialog:update(dt) == true then
                table.remove(self.queue,1)
            end
        else
            for i, q in ipairs(self.queue) do
                if q.id == "slide" then
                    tDone = transitions.slide:update(dt)
                    if tDone == true then
                        table.remove(self.queue,i)
                    end
                    break
                end
                if q.id == "sound" then
                    sound:update(dt)
                    table.remove(self.queue,i)
                    break;
                elseif q.id == "sprite" then
                    sDone = sprite:updateQ(dt)
                    if sDone == true then
                        table.remove(self.queue,i)
                    end
                    if q.pause == true then
                        break
                    end
                elseif q.id == "move" then
                    mDone = sprite:updateQ(dt)
                    if mDone == true then
                        table.remove(self.queue,i)
                    end
                    if q.pause == true then
                        break
                    end
                end
                if q.pause == nil or q.pause == true then -- wait 
                    break
                end
            end
        end
        sprite:update(dt)
    else     --terminate
    return true
    end 
    return false
end

function cutScene:draw()
    if self.background.set == true then
        bg = self.background
        love.graphics.draw(getImage(bg.id),0,0,0,1,1,bg.ox,bg.oy)
    end
    if self.queue ~= nil then --items in queue
        if self:isEmpty() == false then
            if self.queue[1].id == "dialog" then
                dialog:draw()
            end
            sprite:draw()
        end
    end
    transitions:draw()
end

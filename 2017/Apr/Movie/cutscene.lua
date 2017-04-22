--[[
Requirements:
* This must be able to create all nessesary objects and run _
* must create a queue to track all required actions _
* implement a wait() function in the queue to stop the loop from going forward _ 
* must let manager know once task has been completed. _ 

Design:
--plugins - anim8, bump, import (relatable interface for gamedev)

--main.lua

if key.isDown() then
    CS:play("intro")
end

--intro.lua
IM:addImage("back.png","bg") -- own load function
AM:addAnimation("player",1-3,..)
SM:addSprite("player",)
CS:setBackground("bg")
CS:moveSprite(x,y,"object id","animation","image / animation id") --Object must contain all info
CS:wait()
CS:Dialog("Hello World",false,"FF3") -- text, wait for press, style
CS:moveSprite(x,y,"object id","animation","")
]]
require("image")
require("sound")
require("dialog")


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

function cutScene:update(dt)
    --call manager functions
    if self.queue ~= nil and self:isEmpty() == false then --items in queue
        if self.queue[1].id == "dialog" then
            if dialog:update(dt) == true then
                table.remove(self.queue,1)
            end
        else
            for i, q in ipairs(self.queue) do
                if q.id == "sound" then
                    sound:update(dt)
                    table.remove(self.queue,i)
                    break;
                end
                if q.id == "move" then
                end
                if q.pause == nil or q.pause == true then -- wait 
                    break;
                end
            end
        end
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
        end
    end
end

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

]]
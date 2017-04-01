--[[
    bump test for Filter function. Learned functions can be passed as parameters without brackets & about return values
]]
local bump = require "bump"
local world = bump.newWorld(50)

b1 = {id='dog',
x=0,y=0,h=200,w=200}
b2 = {id='dog',
x=400,y=0,h=100,w=100}
speed = 200

local Filter = function(item, other)
    if other.id == 'dog' then
    return 'cross'end
    if other.id == 'cat' then
    return 'touch' end
    return 'bounce'
end

function love.load()
    world:add(b1,b1.x,b1.y,b1.h,b1.w)
    world:add(b2,b2.x,b2.y,b2.h,b2.w)
    love.graphics.setColor(0,0,255,255)
end

function love.update(dt)
        b1.x, b1.y, cols, len = world:move(b1, b1.x + speed*dt,b1.y,Filter)
        b2.x, b2.y, cols, len = world:move(b2, b2.x,b2.y,Filter)
        for i=1,len do
            local other = cols[i].other
            if other.id == 'dog' then love.graphics.setColor(0,255,0,255) end --dont run into each other!
            if other.id == 'cat' then love.graphics.setColor(255,0,0,255) end --move cat!
        end
end

function love.draw()
    love.graphics.rectangle("fill", b1.x, b1.y, b1.h, b1.w)
    love.graphics.rectangle("fill", b2.x, b2.y, b2.h, b2.w)
end

--[[
    MIT LICENSE

    Copyright (c) 2017 Michael Redford

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  ]]
--Level 1

--TODO: Example script. to be scrapped

require 'camera'
require 'player'
require 'dialog'

--MAP Info
local bump = require "bump"
local sti = require "sti"

map = sti("/levels/1-1.lua", {"bump"},0,0)
--love.physics.setMeter(32)
world = bump.newWorld()
map:bump_init(world)
world:add(player, player.x,player.y, player.w, player.h)



sceneStart = false
level1State = "scene1"
step = 0

background = love.graphics.newImage("fade.png")

function level1(dt, action)
  if level1State == "scene1" then
    updateScene1(dt)
    drawScene1()
  elseif state == "game" then
    --game function
  end
end

function updateScene1(dt)
  map:update(dt)
  if sceneStart == false then
    -- Add items
    --fade.in(5) sets bool "actionComplete" to false
    --player.move(x,y,true)
    camera.alpha = 0
    camera.fading = true
    dialog.init()
    sceneStart = true
  end

  if step == 0 then
    if camera.fadeIn(dt) then
      step = step + 1
      print("completed fade in")
    end
  end
  if step == 1 then
    if player.move(200,100,dt) then
      step = step + 1
      print("completed player move")
      dialog.typing = true
    end
    player.aWalking:update(dt)
  end
  if step == 2 then
    if dialog.update("This actually works. Press space to continue.",dt) then
      step = step + 1
      print("completed dialog")
      player.face("right")
    end
  end

  if step == 3 then
    if player.move(500,500,dt) then
      step = step + 1
      print("completed player move")
    end
    player.aWalking:update(dt)
  end

  if step == 4 then
    if camera.alpha >= 254 then camera.fading = true end
    if camera.fadeOut(dt) then
      step = step + 1
      print("completed fade out")
    end
  end
  if step == 5 then
    if camera.alpha <= 0 then camera.fading = true end
    if camera.fadeIn(dt) then
      step = step + 1
      print("completed fade out")
    end
  end

  if step == 6 then
    dialog.typing = true
    if dialog.update("& thus our adventure begins...",dt) then
      step = step + 1
      print("completed dialog...")
    end
  end
  --update functions
  --fade.update() -- each update function must return if it's completed or not. simple bool to check var "actionComplete"
  --player.update()

  --if finished switch state
end

function drawScene1()
  --love.graphics.scale(4,4)
  love.graphics.draw(background,0,0)
  map:setDrawRange(player.x,player.y, love.graphics.getWidth(), love.graphics.getHeight())
  map:draw()
  map:bump_draw(world)
  player.draw()
  --love.graphics.scale(1,1)
  camera.draw()
  dialog.draw()
end

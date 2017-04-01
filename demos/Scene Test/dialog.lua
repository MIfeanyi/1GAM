dialog = {
  nextChar = 1,
  elasped_time = 0,
  wait_time = 0.20,
  string = "Hello World!",
  background = love.graphics.newImage("/img/text background.png"),
  typing = false
}

function dialog.init()
  love.graphics.setNewFont(12)
  love.graphics.print(255,255,255)
end

function dialog.update(string,dt)
  dialog.string = string
  dialog.elasped_time = dialog.elasped_time + dt

  if dialog.elasped_time > dialog.wait_time then
    dialog.nextChar = dialog.nextChar + 3
    dialog.elasped_time = 0
  end

  --TODO: Check keypress & reset
  if love.keyboard.isDown("space") then
    dialog.nextChar = 0
    dialog.elasped_time = 0
    dialog.typing = false
    return true
  end

  return false
end

function dialog.draw()
  if dialog.typing == true then
    love.graphics.draw(dialog.background, 0,love.graphics.getHeight() - 90)
    love.graphics.printf(string.sub(dialog.string,1, dialog.nextChar), 128, love.graphics.getHeight() - 90,love.graphics.getWidth(),"left")
  end
end


--- title screen

love.graphics.setFont(love.graphics.newFont(48))

function updateTitle(dt, action)
  love.graphics.setBackgroundColor(255,255,255)
  love.graphics.setColor(0, 0, 0)
  
  if love.keyboard.isDown('space') then
    --play sound & change state
    love.audio.play(soundM.select)
    return "Level1"
  end
  return "title"
end

function drawTitle()
  love.graphics.print("Working Title", love.graphics.getWidth()/3, love.graphics.getHeight()/2)
end

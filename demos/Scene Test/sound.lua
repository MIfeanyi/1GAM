--module for controlling music & sound effects

--TODO: sfx tracker & player
soundM = {
  shoot = nil,
  jump = nil,
  hurt =  love.audio.newSource("/sfx/hurt.wav"),
  death = nil,
  select = love.audio.newSource("/sfx/select.wav")
  } -- effects in the game.
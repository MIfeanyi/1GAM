require 'cupid'
-- Used for debugging

--TODO

function love.load()
	--Global Variables
  love.window.setTitle("Defender")
  --http://love2d.org/wiki/love.window.setMode
	--http://love2d.org/wiki/love.window.setMode
  --Default Res: 800x600 in lua.conf
  
  state = 'Menu'

  background = love.graphics.newImage("/Graphics/Background.png")
  playerStand = love.graphics.newImage("/Graphics/Player.png")
  
  
  playerX = 200
  playerY = 200
  playerSpeed = 300
  playerFacing = 'left'
  
	--local f = love.graphics.newFont(love._vera_ttf, 14)
    --love.graphics.setFont(f)
	width, height = love.window.getDimensions( )
end

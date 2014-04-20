--TODO
--Look into love.run() http://www.love2d.org/wiki/love.run
function love.load()
	--Global Variables
  love.window.setTitle("Dunk")
  --http://love2d.org/wiki/love.window.setMode
	--http://love2d.org/wiki/love.window.setMode
  --Default Res: 800x600 in lua.conf
  
  state = 'Menu'
  
	--Graphics
	--image = love.graphics.newImage("Farm.png")
  --playerImage = love.graphics.newImage("hotdogboy.png")
  --cpuImage = love.graphics.newImage("pickleman.png")
  --candy = love.graphics.newImage("Candy.png")
  background = love.graphics.newImage("/Graphics/Bridge.png")
  playerStand = love.graphics.newImage("/Graphics/Player Stand.png")
  
  
  playerX = 200
  playerY = 200
  playerSpeed = 175
  playerFacing = 'left'
  
	--local f = love.graphics.newFont(love._vera_ttf, 14)
    --love.graphics.setFont(f)
	width, height = love.window.getDimensions( )
end

--TODO
--Look into love.run() http://www.love2d.org/wiki/love.run
require 'AnAL'

function love.load()
	--Global Variables
  love.window.setTitle("Rage")
  --http://love2d.org/wiki/love.window.setMode
	--http://love2d.org/wiki/love.window.setMode
  --Default Res: 800x600 in lua.conf
  
  state = 'Menu'
  --Set to load Menu methods first
  
  math.randomseed(os.time())
  --Seeding
  
	--Graphics
  playerImage = love.graphics.newImage("/Graphics/Player.png")
  background  = love.graphics.newImage("/Graphics/Background.png")
  knife       = love.graphics.newImage("/Graphics/Knife-Test.png")
  enemy       = love.graphics.newImage("/Graphics/Enemy-test.png")
  playerPunch = love.graphics.newImage("/Graphics/Player-Attack.png")
  --variables for player
  --TODO: Setup class
  playerX = 200
  playerY = 200
  playerSpeed = 175
  playerFacing = 'left'
  playerPunching = false
  playerEquiped = false --Tells if player has knife
  
    --Player Animation
  playerPunchAnim = newAnimation(playerPunch,32,64,0.5,0)
  playerPunchAnim:setMode("once")
  
  --variables for knife
  knifePickedUp = false --Tells if knife is picked up
  kSpawn = false
  knifeX = 0
  knifeY = 0
  knifeDamage = 40
  
  --variables for enemy
  enemyX = 800
  enemyY = 400
  enemySpeed = 50
  
	--local f = love.graphics.newFont(love._vera_ttf, 14)
    --love.graphics.setFont(f)
	width, height = love.window.getDimensions()
end

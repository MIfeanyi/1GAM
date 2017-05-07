require("cutscene")
CS = cutScene

scene1 = {
    done = false
}

function scene1:load() --anything you need to load
    sound:addMusic("Title Theme.mp3","intro")
    addImage("/gfx/player.png","player")
    addImage("/gfx/player-talk.png","player-talk")
    addImage("/gfx/player-sleep.png","player-sleep")
    addImage("/gfx/player-hurt.png","player-hurt")
    sprite:addSprite("player",400,500)
    sprite:addSprite("dude",500,400)
    sprite:addAnimation("dude","player",32,32,"1-2","dude",1,false)
    sprite:addAnimation("dude","player-sleep",32,32,"1-6","sleep",.5,false)
    sprite:addAnimation("player","player",32,32,"1-2","stand",1,false)
    sprite:addAnimation("player","player-sleep",32,32,"1-6","sleep",.5,false)
    sprite:addAnimation("player","player-talk",32,32,"1-3","talk",.5,false)
    sprite:changeAnim("player","sleep")
    sprite:changeAnim("dude","dude")
end

function scene1:script()
    CS:slide("right",{r=255,b=255,g=255,a=255},200)
    CS:moveSprite("player",0,200,300,40,true)
    CS:slide("left",{r=255,b=255,g=255,a=50},200)
    CS:Audio("intro","play")
    CS:addDialog("Individuality is only a dream... a false idea of security in the age of infomation. It can also be argued that DNA is nothing more than a program designed to preserve itself.","TMan",false, 24) --,text,imgID,pause
    CS:changeAnim("player","stand")
    CS:moveSprite("player",200,300,40,true)
    CS:moveSprite("dude",300,300,60,false)
    CS:addDialog("What is this? Some sort of AI?","VMan",false,30)
    CS:changeAnim("player","talk")
    CS:addDialog("Incorrect. I am not an AI. My code name is Project 2501. I am a living, thinking entity that was created in the sea of information.","",false,24)
    CS:changeAnim("dude","sleep")
    CS:moveSprite("player",400,500,60,true)
    CS:addDialog("And can you offer me proof of your existence? How can you, when neither modern science nor philosophy can explain what life is?","",false,12)
    CS:addDialog("**UNKOWN** One this is... The net is vast and infinite.","",false,12)
    CS:Audio("intro","stop")
    --[[ Sprite test
    CS:moveSprite("player",200,300,40) param: id,x,y,speed
    ]]
end

function scene1:run()
    self:load()
    self:script()
end
function scene1:update(dt)
    self.done = CS:update(dt)
end

function scene1:draw()
    CS:draw()
end
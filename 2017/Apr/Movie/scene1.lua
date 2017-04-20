require("cutscene")
CS = cutScene

scene1 = {
    done = false
}

function scene1:load() --anything you need to load
    --addImage("","")
end

function scene1:script()
    CS:addDialog("Individuality is only a dream... a false idea of security in the age of infomation. It can also be argued that DNA is nothing more than a program designed to preserve itself.","TMan",false, 36) --,text,imgID,pause
    CS:addDialog("What is this? Some sort of AI?","VMan",false,30)
    CS:addDialog("Incorrect. I am not an AI. My code name is Project 2501. I am a living, thinking entity that was created in the sea of information.","",false,36)
    CS:addDialog("And can you offer me proof of your existence? How can you, when neither modern science nor philosophy can explain what life is?","",false,36)
    CS:addDialog("**UNKOWN** One this is... The net is vast and infinite.","",false,36)
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
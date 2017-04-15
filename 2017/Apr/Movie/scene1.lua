require("cutscene")
CS = cutScene

scene1 = {
    done = false
}

function scene1:load() --anything you need to load
    --addImage("","")
end

function scene1:script()
    CS:addDialog("Individuality is only a dream... a false idea of security in the age of infomation.","TMan",false, 36) --,text,imgID,pause
    CS:addDialog("What is this? Some sort of AI?","VMan",false,24)
    CS:addDialog("No, I am a living thinking program created to surpass current convex operations.","",false,48)
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
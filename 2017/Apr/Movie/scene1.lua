require("cutscene")
CS = cutScene

scene1 = {
    done = false
}

function scene1:asests() --anything you need to load
    --addImage("","")
end

function scene1:script()
    CS:addDialog("Hey! we're waiting for you...","TMan",false, 36) --,text,imgID,pause
    CS:addDialog("I really hope it works.....","VMan",false,24)
    CS:addDialog("Hey! Wakeup!","",false,48)
end

function scene1:run()
    self:asests()
    self:script()
end
function scene1:update(dt)
    self.done = CS:update(dt)
end

function scene1:draw()
    CS:draw()
end
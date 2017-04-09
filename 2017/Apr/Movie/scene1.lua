require("cutscene")
CS = cutScene

scene1 = {
    done = false,
    dialogPause = true
}

function scene1:asests() --anything you need to load
end

function scene1:script()
    CS:addDialog("This is a test.","TMan",false) --id,text,imgID,pause
    CS:addDialog("I really hope it works","VMan",false)
    CS:addDialog("Hello World!","",false)
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
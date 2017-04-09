dialog = {
    fontSize=12,
    fontColor ={r=255,g=255,b=255},
    nextChar = 1,
    curT = 0,
    waitT = 1.05,
    speed = 3,
    dialogs = {}, --text={id,string,imgId,}
    finished = false
}

function dialog:changeColor(r,g,b)
    color = self.fontColor
    color.r, color.g, color.b = r,g,b
end

function dialog:push(id,text,imgID)
    newDialog = {id=id,text=text,imgID=imgID}
    table.insert(self.dialogs,newDialog)
end

function dialog:update(dt)
    self.curT = self.curT+dt
    if self.curT > self.waitT then
        self.nextChar = self.nextChar+self.speed
        self.curT=0
    end
    if string.len(self.dialogs[1].text) <= self.nextChar then
        self.nextChar = string.len(self.dialogs[1].text)
        if love.keyboard.isDown('space') then
            table.remove(self.dialogs,1)
            self:reset()
            return true
        end
    end
    return false
end

function dialog:draw()
    text = self.dialogs[1].text
    love.graphics.printf(string.sub(text,0,self.nextChar),0,0,200,"left")
end

function dialog:reset()
    self.nextChar = 0
    self.curT = 0
end
dialog = {
    fontSize=24,
    fontColor ={r=255,g=255,b=255},
    windowColor ={r=0,g=0,b=255,a=25},
    nextChar = 1,
    curT = 0,
    waitT = 0.03,
    speed = 1,
    dialogs = {}, --text={id,string,imgId,}
    finished = false,
    height= 200,
    window="default", -- draw via colors
    border = 10
}

function dialog:changeColor(r,g,b,a)
    color = self.fontColor
    color.r, color.g, color.b, color.a = r,g,b,a
end

function dialog:changeSpeed(speed)
    self.speed = speed
end

function dialog:push(id,text,imgID,size)
    newDialog = {id=id,text=text,imgID=imgID}
    if size ~= nil then
        --love.graphics.setNewFont(size)
        newDialog.size = size
    end
    table.insert(self.dialogs,newDialog)
end

function dialog:update(dt) --TODO: add nil check
    self.curT = self.curT+dt
    if self.curT > self.waitT then
        self.nextChar = self.nextChar+self.speed
        self.curT=0
    end
    if self.dialogs[1].size ~= nil then
        love.graphics.setNewFont(self.dialogs[1].size)
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
    Color = self.windowColor
    love.graphics.setColor(Color.r,Color.g,Color.b,Color.a)
    love.graphics.rectangle("fill", 0, 0,love.graphics.getWidth(),self.height)
    love.graphics.setColor(255,255,255,255)
    text = self.dialogs[1].text
    love.graphics.printf(string.sub(text,0,self.nextChar),self.border,self.border,love.graphics.getWidth()-self.border,"left")
end

function dialog:reset()
    self.nextChar = 0
    self.curT = 0
end
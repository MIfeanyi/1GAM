
sound = {
    sounds = {}, -- stored sounds
    queue = {} -- queue for sound actions
}

function sound:isEmpty()
    for _, _ in ipairs(self.queue) do
        return false
    end
    return true
end

function sound:addSound(src,id)
    local sound = love.audio.newSource(src,"static")
    local newSound = {sfx = sound, id=id}
    table.insert(self.sounds,newSound)
end

function sound:addMusic(src,id)
    local sound = love.audio.newSource(src)
    local newSound = {sfx = sound, id=id}
    table.insert(self.sounds,newSound)
end

function sound:getSound(id)
    for i, s in ipairs(self.sounds) do
        if s.id == id then
            return s.sfx
        end
    end
end

function sound:push(id,action)
    newSound = {id=id,action=action}
    table.insert(self.sounds,newSound)
end

function sound:update(dt)
    if self:isEmpty() == false then
        if self.queue[1].action == "play" then
            love.audio.play(self:getSound(self.queue[1].id))
        elseif self.queue[1].action == "stop" then
            love.audio.stop(self:getSound(self.queue[1].id))
end

function deleteSound(id)
    for i, s in ipairs(sounds) do
        if s.id == id or s.id == nil then
            table.remove(sounds,i)
        end
    end
end
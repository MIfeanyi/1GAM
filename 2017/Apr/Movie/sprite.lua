
sprite = {
    sprites={},
    queue={}
}

function sprite:addSprite(id,x,y,)
    newSprite = {id=id,aId,animations={},x,y}
    table.insert(self.sprites,newSprite)
end

function sprite:addAnim(id,ai) -- add anim8 parameters
end

function sprite:changeAnim(sId,aId)
end

function sprite:update(dt)
    for i, s in ipairs(self.sprites) do
        --update animations
    end
end

function sprite:draw(id,x,y)
end
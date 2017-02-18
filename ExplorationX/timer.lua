timer = {elaspedTime = 0, maxTime, done = false}

function timer:start(time, dt)
  self.maxTime, self.elaspedTime = time, (self.elaspedTime +dt)
end

function timer:reset()
  self.elaspedTime = 0
end

function timer:update(dt)
  self.eleaspedTime = self.elaspedTime + dt
end

function timer:stop()
  return self.elaspedTime
end

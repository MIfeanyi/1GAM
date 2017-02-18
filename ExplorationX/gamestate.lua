require 'units'

waveManager = { elaspedTime = 0, waitTime = 10, nextWave = false}

function waveManager:update(dt)
  self.elaspedTime = self.elaspedTime + dt
  if self.elaspedTime >= self.waitTime then self.nextWave = true end
end
function waveManager:reset()
  self.elaspedTime = 0 
  self.nextWave = false
end

--{running = false, img, currentWave = 1, waves = 2, dificulty = 1, maxEnemies = 20, spawned = 0}
--contains all levels
function setCurrentLevel(name)
  currentLevel = name
end

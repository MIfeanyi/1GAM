--To midigate cluster in main
require 'system'
require 'menu'
require 'level'
require 'game'

state = { -- menu, level, game, exit
  current = "menu"
}

function state:switchState(state)
  self.current = state
end

function state.update(dt)
  if state.current == "menu" then state.current = updateMenu(dt) end
  if state.current == "level" then state.current = updateLevel(dt) end
  if state.current == "game" then state.current = game:update(dt) end
end

function state.draw()
    if state.current == "menu" then state.current = drawMenu() end
    if state.current == "level" then state.current = drawLevel() end
    if state.current == "game" then state.current = game:draw() end
  end
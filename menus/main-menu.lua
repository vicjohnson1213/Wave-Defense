local buttonEntity = require('forms.button')
local state = require('state')

local startGame = function()
    state.activePage = 'Game'
end

local menu = {}

menu.buttons = {
    buttonEntity('Start Game', 100, 100, startGame)
}

menu.draw = function(self)
    for _, button in ipairs(self.buttons) do
        if button.draw then button:draw() end
    end
end

menu.update = function(self, dt)
    for _, button in ipairs(self.buttons) do
        if button.update then button:update() end
    end
end

menu.onMousePressed = function(self, x, y, b)
    if b ~= 1 then return end
    for _, button in ipairs(self.buttons) do
        if button.onMousePressed then button:onMousePressed(x, y) end
    end
end

menu.onMouseReleased = function(self, x, y, b)
    if b ~= 1 then return end
    for _, button in ipairs(self.buttons) do
        if button.onMouseReleased then button:onMouseReleased(x, y) end
    end
end

return menu
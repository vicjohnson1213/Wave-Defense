local buttonEntity = require('interface.button')
local state = require('state')
local input = require('input')
local settings = require('settings')
local constants = require('constants')

local startGame = function()
    state.activePage = constants.Page.Game
end

local menu = {}
local templateButton = buttonEntity('nothing', 0, 0)

menu.selectionTimer = 0
menu.selectedIndex = 1

menu.buttons = {
    buttonEntity('Start Game', 100, 100, startGame),
    buttonEntity('Settings', 100, 100 + templateButton:getHeight() + 20),
    buttonEntity('Exit Game', 100, 100 + ((templateButton:getHeight() + 20) * 2), function() love.event.quit() end)
}

menu.buttons[menu.selectedIndex].state = constants.ButtonState.Hover

menu.draw = function(self)
    for _, button in ipairs(self.buttons) do
        if button.draw then button:draw() end
    end
end

menu.update = function(self, dt)
    self.selectionTimer = self.selectionTimer + dt

    for _, button in ipairs(self.buttons) do
        if button.update then button:update() end
    end

    if input.getButton('a') then
        if self.buttons[self.selectedIndex].onClick then
            self.buttons[self.selectedIndex]:onClick()
        end
    end

    if self.selectionTimer < (1 / settings.interface.menu.buttonSwitchRate) then
        return
    end

    local leftX, leftY = input.getAxis('leftJoy')
    if leftY < 0 then
        self:selectButton(self.selectedIndex - 1)
        self.selectionTimer = 0
    elseif leftY > 0 then
        self:selectButton(self.selectedIndex + 1)
        self.selectionTimer = 0
    end
end

menu.selectButton = function(self, idx)
    self.buttons[self.selectedIndex].state = constants.ButtonState.None
    self.selectedIndex = math.max(math.min(idx, table.getn(self.buttons)), 1)
    self.buttons[self.selectedIndex].state = constants.ButtonState.Hover
end

return menu
local playerEntity = require('entities.player')
local bulletEntity = require('entities.bullet')
local rifleWeapon = require('weapons.rifle')

local winWidth, winHeight = love.window.getMode()

local game = {}

game.player = playerEntity(winWidth / 2, winHeight / 2, rifleWeapon)

game.draw = function(self)
    if self.player.draw then self.player:draw() end
end

game.update = function(self, dt)
    if self.player.update then self.player:update(dt) end
end

return game
local playerEntity = require('entities.player')
local bulletEntity = require('entities.bullet')
local rifleWeapon = require('weapons.rifle')

local winWidth, winHeight = love.window.getMode()

local entities = {}

entities.player = playerEntity(winWidth / 2, winHeight / 2, rifleWeapon)

return entities
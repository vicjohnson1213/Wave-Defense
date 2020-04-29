local playerEntity = require('entities.player')
local bulletEntity = require('entities.bullet')

local entities = {}
local winWidth, winHeight = love.window.getMode()

entities.player = playerEntity(winWidth / 2, winHeight / 2)

entities.bullets = {}
entities.addBullet = function(x, y, directionX, directionY)
    entities.bullets[#entities.bullets + 1] = bulletEntity(x, y, directionX, directionY)
end

return entities
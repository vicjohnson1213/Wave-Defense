local input = require('input')
local settings = require('settings')
local utils = require('utils')

local debugger = {}

local printControllerData = function()
    local winWidth, winHeight = love.window.getMode()
    local leftX, leftY, leftAngle = input.getAxis('leftJoy')
    local rightX, rightY, rightAngle = input.getAxis('rightJoy')

    love.graphics.print('leftA ' .. utils.round(math.deg(leftAngle), 3), 5, winHeight - 120, 0, 1, 1)
    love.graphics.print('leftX ' .. utils.round(leftX, 3), 5, winHeight - 100, 0, 1, 1)
    love.graphics.print('leftY ' .. utils.round(leftY, 3), 5, winHeight - 80, 0, 1, 1)
    love.graphics.print('rightA ' .. utils.round(math.deg(rightAngle), 3), 5, winHeight - 60, 0, 1, 1)
    love.graphics.print('rightX ' .. utils.round(rightX, 3), 5, winHeight - 40, 0, 1, 1)
    love.graphics.print('rightY ' .. utils.round(rightY, 3), 5, winHeight - 20, 0, 1, 1)
end

local printFrameRate = function()
    love.graphics.print(love.timer.getFPS() .. 'fps', 5, 5, 0, 1, 1)
end

debugger.debug = function()
    love.graphics.setColor(settings.colors.debug)
    if settings.debug.controllerData then printControllerData() end
    if settings.debug.frameRate then printFrameRate() end
    love.graphics.setColor(settings.colors.default)
end

return debugger
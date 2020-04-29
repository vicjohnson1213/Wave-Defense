local input = require('input')
local settings = require('settings')

local debugger = {}

local printControllerData = function()
    local winWidth, winHeight = love.window.getMode()
    local leftX, leftY = input.getStickDirection('left')
    local rightX, rightY = input.getStickDirection('right')

    love.graphics.print('leftX ' .. leftX, 5, winHeight - 80, 0, 1, 1)
    love.graphics.print('leftY ' .. leftY, 5, winHeight - 60, 0, 1, 1)
    love.graphics.print('rightX ' .. rightX, 5, winHeight - 40, 0, 1, 1)
    love.graphics.print('rightY ' .. rightY, 5, winHeight - 20, 0, 1, 1)
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
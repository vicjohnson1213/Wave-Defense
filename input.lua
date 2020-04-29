local settings = require('settings')
local state = require('state')

local input = {}

local keyMap = {
    escape = function() state.paused = not state.paused end,
    q = function() love.event.quit() end
}

local checkDeadzone = function(val)
    if math.abs(val) < settings.controller.Deadzone then
        return 0
    end

    return val
end

input.getStickDirection = function(stick)
    local joysticks = love.joystick.getJoysticks()
    local hasJoySicks = table.getn(joysticks)

    if not hasJoySicks then return 0, 0 end

    local leftJoyX, leftJoyY, _, rightJoyX, rightJoyY = joysticks[1]:getAxes()

    if stick == 'left' then
        return checkDeadzone(leftJoyX), checkDeadzone(leftJoyY)
    elseif stick == 'right' then
        return checkDeadzone(rightJoyX), checkDeadzone(rightJoyY)
    end
end

input.keyPressed = function(key)
    if keyMap[key] then keyMap[key]() end
end

return input
local settings = require('settings')
local state = require('state')
local constants = require('constants')
local utils = require('utils')

local input = {}

local keyMap = {
    escape = function() state.paused = not state.paused end,
    q = function() love.event.quit() end
}

local checkDeadzone = function(val)
    local deadzone = settings.controller.MenuDeadzone
    if state.activePage == constants.Page.Game then deadzone = settings.controller.PlayDeadzone end
    if math.abs(val) < deadzone then
        return 0
    end

    return val
end

local getAngle = function(x, y)
    local angle = math.atan2(y, x)
    if angle >= 0 then return angle end
    return (math.pi) + (math.pi - math.abs(angle))
end

input.getAxis = function(axis)
    local joysticks = love.joystick.getJoysticks()
    local hasJoySicks = table.getn(joysticks)

    if not hasJoySicks then return 0, 0 end

    local leftJoyX, leftJoyY, leftTrigger, rightJoyX, rightJoyY, rightTrigger = joysticks[1]:getAxes()

    if axis == 'leftJoy' then
        local angle = getAngle(checkDeadzone(leftJoyX), checkDeadzone(leftJoyY))
        return checkDeadzone(leftJoyX), checkDeadzone(leftJoyY), angle
    elseif axis == 'rightJoy' then
        local angle = getAngle(checkDeadzone(rightJoyX), checkDeadzone(rightJoyY))
        return checkDeadzone(rightJoyX), checkDeadzone(rightJoyY), angle
    elseif axis == 'leftTrigger' then
        return leftTrigger
    elseif axis == 'rightTrigger' then
        return rightTrigger
    end
end

input.getButton = function(button)
    local joysticks = love.joystick.getJoysticks()
    local hasJoySicks = table.getn(joysticks)

    if not hasJoySicks then return false end

    return joysticks[1]:isGamepadDown(button)
end

input.keyPressed = function(key)
    if keyMap[key] then keyMap[key]() end
end

return input
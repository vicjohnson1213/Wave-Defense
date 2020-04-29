local world = require('world')
local state = require('state')
local input = require('input')
local entities = require('entities')
local debugger = require('debugger')

love.draw = function()
    if entities.player.draw then entities.player:draw() end
    for _, bullet in ipairs(entities.bullets) do
        if bullet.draw then bullet:draw() end
    end

    debugger.debug()
end

love.keypressed = function(key)
    input.keyPressed(key)
end

love.update = function(dt)
    if state.paused then return end

    if entities.player.update then entities.player:update(dt) end

    local rightX, rightY = input.getStickDirection('right')
    if (math.abs(rightX) > 0 or math.abs(rightY) > 0) and entities.player.canFire then
        local playerCenterX, playerCenterY = entities.player:getCenter()
        local playerRadius = entities.player:getRadius()

        local magnitude = math.sqrt(rightX^2 + rightY^2)
        local normalizedX = (rightX / magnitude) * playerRadius + playerCenterX
        local normalizedY = (rightY / magnitude) * playerRadius + playerCenterY

        entities.addBullet(normalizedX, normalizedY, rightX, rightY)
        entities.player:fire()
    end

    for _, bullet in ipairs(entities.bullets) do
        if bullet.update then bullet:update() end
    end

    world:update(dt)

end

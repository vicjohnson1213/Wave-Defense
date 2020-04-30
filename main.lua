local world = require('world')
-- local state = require('state')
local input = require('input')
local entities = require('entities')
local debugger = require('debugger')

love.draw = function()
    if entities.player.draw then entities.player:draw() end
    debugger.debug()
end

love.keypressed = function(key)
    input.keyPressed(key)
end

love.update = function(dt)
    if entities.player.update then entities.player:update(dt) end

    world:update(dt)
end
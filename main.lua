local world = require('world')
local state = require('state')
local constants = require('constants')
local input = require('input')
local game = require('game')
local debugger = require('debugger')
local mainMenu = require('menus.main-menu')

love.load = function()
end

love.draw = function()
    if state.activePage == constants.Page.MainMenu then
        if mainMenu.draw then mainMenu:draw() end
    elseif state.activePage == constants.Page.Game then
        if game.draw then game:draw() end
    end

    debugger.debug()
end

love.keypressed = function(key)
    input.keyPressed(key)
end

love.update = function(dt)
    if state.activePage == constants.Page.MainMenu then
        if mainMenu.update then mainMenu:update(dt) end
    elseif state.activePage == constants.Page.Game then
        if game.update then game:update(dt) end
    end

    world:update(dt)
end

love.keypressed = function(key)
    if key == 'q' then love.event.quit() end
end
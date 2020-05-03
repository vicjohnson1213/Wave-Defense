local world = require('world')
local state = require('state')
local input = require('input')
local entities = require('entities')
local debugger = require('debugger')
local mainMenu = require('menus.main-menu')

love.draw = function()
    if state.activePage == 'MainMenu' then
        if mainMenu.draw then mainMenu:draw() end
    elseif state.activePage == 'Game' then
        if entities.player.draw then entities.player:draw() end
    end

    debugger.debug()
end

love.keypressed = function(key)
    input.keyPressed(key)
end

love.update = function(dt)
    if state.activePage == 'MainManu' then
        if mainMenu.update then mainMenu:update(dt) end
    elseif state.activePage == 'Game' then
        if entities.player.update then entities.player:update(dt) end
    end

    world:update(dt)
end

love.mousepressed = function(x, y, button)
    if mainMenu.onMousePressed then mainMenu:onMousePressed(x, y, button) end
end

love.mousereleased = function(x, y, button)
    if mainMenu.onMouseReleased then mainMenu:onMouseReleased(x, y, button) end
end

love.keypressed = function(key)
    if key == 'q' then love.event.quit() end
end
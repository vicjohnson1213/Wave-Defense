local world = require('world')
local input = require('input')
local settings = require('settings')

return function(x, y)
    local entity = {}

    entity.fireTimer = 0
    entity.canFire = true

    entity.shape = love.physics.newRectangleShape(x, y, settings.weapons.rifle.length, settings.weapons.rifle.width)
    entity.width = settings.weapons.rifle.width
    entity.length = settings.weapons.rifle.length

    local barrelX = x + (settings.weapons.rifle.length / 2)
    local barrelY = y
    entity.barrelShape = love.physics.newCircleShape(barrelX, barrelY, 2)

    entity.draw = function(self)
        love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))

        if settings.debug.weaponBarrel then
            local currentBarrelX, currentBarrelY = self.body:getWorldPoint(self.barrelShape:getPoint())
            love.graphics.circle('line', currentBarrelX, currentBarrelY, 2)
        end
    end

    entity.update = function(self, dt)
        self.fireTimer = self.fireTimer + dt
        local canFire = self.fireTimer > (1 / settings.weapons.rifle.rateOfFire)
        if canFire and input.getAxis('rightTrigger') > 0 then
            if self.onFire then self.onFire() end
            self.fireTimer = 0
        end
    end

    return entity
end
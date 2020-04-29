local world = require('world')
local input = require('input')
local settings = require('settings')

return function(x, y)
    local entity = {}
    entity.fireTimer = 0
    entity.canFire = true

    entity.body = love.physics.newBody(world, x, y, 'kinematic')
    entity.shape = love.physics.newCircleShape(10)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setUserData(entity)

    entity.draw = function(self)
        local selfX, selfY = self.body:getWorldCenter()
        love.graphics.circle('fill', selfX, selfY, self.shape:getRadius())
    end

    entity.update = function(self, dt)
        self.fireTimer = self.fireTimer + dt
        if self.fireTimer > (1 / settings.weapon.rateOfFire) then
            self.canFire = true
        end

        local leftX, leftY = input.getStickDirection('left')
        self.body:setLinearVelocity(leftX * settings.player.maxVelocity, leftY * settings.player.maxVelocity)
    end

    entity.getCenter = function(self)
        return self.body:getWorldCenter()
    end

    entity.getRadius = function(self)
        return self.shape:getRadius()
    end

    entity.fire = function(self)
        self.fireTimer = 0
        self.canFire = false
    end

    return entity
end
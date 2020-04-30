local world = require('world')
local settings = require('settings')
local utils = require('utils')

return function(x, y, directionX, directionY)
    local entity = {}
    entity.body = love.physics.newBody(world, x, y, 'dynamic')
    entity.shape = love.physics.newCircleShape(0, 0, settings.weapons.rifle.bulletRadius)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setUserData(entity)

    entity.type = 'bullet'

    local normX, normY = utils.normalize(directionX, directionY)

    entity.body:setLinearVelocity(
        normX * settings.weapons.rifle.bulletVelocity,
        normY * settings.weapons.rifle.bulletVelocity
    )

    entity.draw = function(self)
        local selfX, selfY = self.body:getWorldCenter()
        love.graphics.circle('fill', selfX, selfY, self.shape:getRadius())
    end

    return entity
end
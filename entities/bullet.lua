local world = require('world')
local input = require('input')
local settings = require('settings')

return function(x, y, directionX, directionY)
    local entity = {}
    entity.body = love.physics.newBody(world, x, y, 'dynamic')
    entity.body:setLinearVelocity(directionX, directionY)
    entity.shape = love.physics.newCircleShape(0, 0, 2)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setUserData(entity)
    entity.fixture:setRestitution(1)

    entity.type = 'bullet'

    local magnitude = math.sqrt(directionX^2 + directionY^2)
    local normalizedDirection = {
        x = directionX / magnitude,
        y = directionY / magnitude
    }

    entity.body:setLinearVelocity(
        normalizedDirection.x * settings.weapon.bulletVelocity,
        normalizedDirection.y * settings.weapon.bulletVelocity
    )

    entity.draw = function(self)
        local selfX, selfY = self.body:getWorldCenter()
        love.graphics.circle('fill', selfX, selfY, self.shape:getRadius())
    end

    return entity
end
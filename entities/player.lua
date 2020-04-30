local world = require('world')
local input = require('input')
local settings = require('settings')
local bulletEntity = require('entities.bullet')

return function(initX, initY, startWeapon)
    local entity = {}

    entity.body = love.physics.newBody(world, initX, initY, 'kinematic')
    entity.shape = love.physics.newRectangleShape(settings.player.height, settings.player.width)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setUserData(entity)

    entity.activeWeapon = startWeapon((settings.player.height / 2) - 4, (settings.player.width / 2) + 6)
    entity.activeWeapon.body = entity.body
    entity.weaponFixture = love.physics.newFixture(entity.body, entity.activeWeapon.shape)
    entity.weaponFixture:setUserData(entity.activeWeapon)

    entity.bullets = {}
    entity.activeWeapon.onFire = function()
        local angle = entity.body:getAngle()
        local directionX = math.cos(angle)
        local directionY = math.sin(angle)

        local x, y = entity.body:getWorldPoint(entity.activeWeapon.barrelShape:getPoint())

        entity.bullets[#entity.bullets + 1] = bulletEntity(x, y, directionX, directionY)
    end

    entity.draw = function(self)
        love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
        if self.activeWeapon.draw then self.activeWeapon:draw() end
        for _, bullet in ipairs(self.bullets) do
            if bullet.draw then bullet:draw() end
        end
    end

    entity.update = function(self, dt)
        local leftX, leftY = input.getAxis('leftJoy')
        local rightX, rightY, angle = input.getAxis('rightJoy')
        self.body:setLinearVelocity(leftX * settings.player.maxVelocity, leftY * settings.player.maxVelocity)

        local shouldSetAngle = math.abs(rightX) > 0 and math.abs(rightY) > 0
        if shouldSetAngle then
            self.body:setAngle(angle)
        end

        if entity.activeWeapon.update then entity.activeWeapon:update(dt) end
    end

    return entity
end
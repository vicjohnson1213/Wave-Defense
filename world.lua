local beginCollision = function()
end

local endCollision = function()
end

local world = love.physics.newWorld(0, 0)

world:setCallbacks(
    beginCollision,
    endCollision, 
    nil, 
    nil
)

return world
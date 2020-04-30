local utils = {}

utils.round = function(num, places)
    local mult = 10^(places or 0)
    return math.floor(num * mult + 0.5) / mult
end

utils.normalize = function(x, y)
    local magnitude = math.sqrt(x^2 + y^2)
    x = x / magnitude
    y = y / magnitude

    return x, y
end

return utils
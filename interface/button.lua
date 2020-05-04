local settings = require('settings')
local constants = require('constants')

return function(text, x, y, onClick)
    local button = {}

    button.text = text
    button.onClick = onClick
    button.position = {
        x = x, y = y
    }

    button.hoverOffset = settings.interface.button.hoverOffset
    button.width = settings.interface.button.width
    button.padding = settings.interface.button.padding
    button.borderRadius = settings.interface.button.borderRadius
    button.colors = settings.interface.button.colors
    button.font = settings.interface.button.font

    button.state = constants.ButtonState.None

    button.draw = function(self)
        local bgColor = self.colors.bgColor
        local fgColor = self.colors.fgColor

        if self.state == constants.ButtonState.Hover then bgColor = self.colors.hover.bgColor end
        if self.state == constants.ButtonState.Hover then fgColor = self.colors.hover.fgColor end

        if self.state == constants.ButtonState.Pressed then bgColor = self.colors.pressed.bgColor end
        if self.state == constants.ButtonState.Pressed then fgColor = self.colors.pressed.fgColor end

        love.graphics.setColor(bgColor)
        local xOffset = self.state == constants.ButtonState.Hover and self.hoverOffset.x or 0
        local yOffset = self.state == constants.ButtonState.Hover and self.hoverOffset.y or 0
        love.graphics.rectangle('fill', x + xOffset, y + yOffset, self.width, self:getHeight(), self.borderRadius)

        love.graphics.setFont(self.font)
        love.graphics.setColor(fgColor)
        love.graphics.print(self.text, x + self.padding.x + xOffset, y + self.padding.y + yOffset)

        love.graphics.setColor({ 0, 0, 0, 1 })
    end

    button.update = function(self)
    end

    button.getHeight = function(self)
        return (self.padding.y * 2) + self.font:getHeight()
    end

    return button
end
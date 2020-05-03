local settings = require('settings')

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

    button.state = 'none'

    button.draw = function(self)
        local bgColor = self.colors.bgColor
        local fgColor = self.colors.fgColor

        if self.state == 'hover' then bgColor = self.colors.hover.bgColor end
        if self.state == 'hover' then fgColor = self.colors.hover.fgColor end

        if self.state == 'pressed' then bgColor = self.colors.pressed.bgColor end
        if self.state == 'pressed' then fgColor = self.colors.pressed.fgColor end

        love.graphics.setColor(bgColor)
        local xOffset = self.state == 'hover' and self.hoverOffset.x or 0
        local yOffset = self.state == 'hover' and self.hoverOffset.y or 0
        love.graphics.rectangle('fill', x + xOffset, y + yOffset, self.width, self:getHeight(), self.borderRadius)

        love.graphics.setFont(self.font)
        love.graphics.setColor(fgColor)
        love.graphics.print(self.text, x + self.padding.x + xOffset, y + self.padding.y + yOffset)

        love.graphics.setColor({ 0, 0, 0, 1 })
    end

    button.update = function(self)
        -- If the button is pressed, we want to let the pressed/released handlers manage the button state.
        if self.state == 'pressed' then return end

        if self:contiansMouse() then
            self.state = 'hover'
        else
            self.state = 'none'
        end
    end

    button.getHeight = function(self)
        return (self.padding.y * 2) + self.font:getHeight()
    end

    button.onMousePressed = function(self, x, y)
        if self:contiansMouse() then
            self.state = 'pressed'
        end
    end

    button.onMouseReleased = function(self, x, y)
        self.state = 'none'
        if self:contiansMouse() then
            if self.onClick then self.onClick() end
        end
    end

    button.contiansMouse = function(self)
        local mouseX, mouseY = love.mouse.getPosition()
        local inX = (mouseX > self.position.x) and (mouseX < self.position.x + self.width)
        local inY = (mouseY > self.position.y) and (mouseY < self.position.y + self:getHeight())
        return inX and inY
    end

    return button
end
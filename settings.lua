return {
    debug = {
        controllerData = true,
        frameRate = true,
        weaponBarrel = true
    },

    controller = {
        Deadzone = 0.075
    },

    player = {
        maxVelocity = 250,
        width = 20,
        height = 15
    },

    weapons = {
        rifle = {
            style = 'auto',
            bulletRadius = 2,
            bulletVelocity = 500,
            rateOfFire = 35,
            length = 30,
            width = 4
        }
    },

    colors = {
        default = { 1, 1, 1, 1 },
        debug = { 1, 1, 1, 0.5 },
    },

    interface = {
        button = {
            hoverOffset = { x = 0, y = 0 },
            width = 300,
            padding = { x = 20, y = 10 },
            borderRadius = 10,
            font = love.graphics.newFont('assets/fonts/RobotoMono-Regular.ttf', 20),
            colors = {
                bgColor = { 1, 1, 1, 1 },
                fgColor = { 1, 0, 0, 1 },
                hover = {
                    bgColor = { 0.9, 0.9, 0.9, 1 },
                    fgColor = { 1, 0, 0, 1 }
                },
                pressed = {
                    bgColor = { 0.8, 0.8, 0.8, 1 },
                    fgColor = { 1, 0, 0, 1 }
                }
            }
        }
    }
}
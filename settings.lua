return {
    debug = {
        controllerData = true,
        frameRate = true,
        weaponBarrel = true
    },

    controller = {
        PlayDeadzone = 0.1,
        MenuDeadzone = 0.5
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
            rateOfFire = 25,
            length = 30,
            width = 4
        }
    },

    colors = {
        default = { 1, 1, 1, 1 },
        debug = { 1, 1, 1, 0.5 },
    },

    interface = {
        menu = {
            buttonSwitchRate = 3
        },
        button = {
            hoverOffset = { x = 30, y = 0 },
            width = 300,
            padding = { x = 20, y = 10 },
            borderRadius = 10,
            font = love.graphics.newFont('assets/fonts/RobotoMono-Regular.ttf', 20),
            colors = {
                bgColor = { 1, 1, 1, 1 },
                fgColor = { 1, 0, 0, 1 },
                hover = {
                    bgColor = { 0.0, 0.8, 0.8, 1 },
                    fgColor = { 1, 0, 0, 1 }
                },
                pressed = {
                    bgColor = { 0.6, 0.6, 0.6, 1 },
                    fgColor = { 1, 0, 0, 1 }
                }
            }
        }
    }
}
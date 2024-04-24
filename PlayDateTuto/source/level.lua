import "CoreLibs/graphics"
import "CoreLibs/object"

local pd <const> = playdate
local gfx <const> = pd.graphics

class ('level').extends(gfx.graphics)

function level:init()
    level.super.init(self)
end

function level:createLevel()

    for i = 80, 410, 80 do
        gfx.drawLine(i , 0, i, 240)
    end

    for i = 80, 240, 80 do
        gfx.drawLine(80 , i, 320, i)
    end

end

import "CoreLibs/graphics"
import "CoreLibs/object"

local pd <const> = playdate
local gfx <const> = pd.graphics

class ('level').extends(gfx.graphics)

function level:init()
    level.super.init(self)
    self.availableBox = {{120,40},{200,40},{280,40},
                         {120,120},{200,120},{280,120},
                         {120,200},{200,2000},{280,200}
                        }
    return self.availableBox
end

function level:createLevel()

    for i = 80, 410, 80 do
        gfx.drawLine(i , 0, i, 240)
    end

    for i = 80, 240, 80 do
        gfx.drawLine(80 , i, 320, i)
    end

    

end

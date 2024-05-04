import "CoreLibs/graphics"
import "CoreLibs/object"
import "player/player"

local pd <const> = playdate
local gfx <const> = pd.graphics

class ('level').extends(gfx.graphics)

function level:init()
    level.super.init(self)

end

function level:createLevel()

    availableBox = {{120,40},{200,40},{280,40},
    {120,120},{200,120},{280,120},
    {120,200},{200,200},{280,200}
                    }

    for i = 80, 410, 80 do
        gfx.drawLine(i , 0, i, 240)
    end

    for i = 80, 240, 80 do
        gfx.drawLine(80 , i, 320, i)
    end

    return availableBox

end

function level:updateAvailableBox(availableBox, instance)

    if instance ~= nil then
        x = instance.x
        y = instance.y

        for i in pairs(availableBox) do
            if availableBox[i][1] == x and availableBox[i][2] == y then
                table.remove(availableBox, i)
            end
        end


        return availableBox

    else 
        print("Roger, roger")
    end

end

function level:isAvailableBox(availableBox, x, y)
    for i in pairs(availableBox) do
        print("je teste")
        if availableBox[i][1] == x and availableBox[i][2] == y then
            return true
        end
    end 
    return false
end
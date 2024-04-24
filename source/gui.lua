import "CoreLibs/graphics"
import "CoreLibs/object"

local pd <const> = playdate
local gfx <const> = pd.graphics

class ('gui').extends(gfx.graphics)

function gui:init()
    gui.super.init(self)
end

function gui:createGUI()
    gfx.drawLine(320 , 0, 320, 240)   
end

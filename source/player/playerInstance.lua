import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Instance').extends(gfx.sprite)

function Instance:init(x, y, img)
    Instance.super.init(self)

    self.x = x
    self.y = y
    self.img = img
    
    local instanceImage = gfx.image.new(self.img)
        assert(instanceImage)

    gfx.pushContext(instanceImage)
        playerInstance = gfx.sprite.new( instanceImage )
    gfx.popContext(instanceImage)

    self:moveTo(self.x , self.y)

    self:setImage(instanceImage)  


    print("I'm created at " .. "  " .. self.x .."  " .. self.y  )
    
end

function Instance:GetPosition()
    print(self.x)
end

function Instance:update()

    
end
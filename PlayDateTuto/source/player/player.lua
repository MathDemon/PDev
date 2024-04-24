import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "playerInstance"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y, img)
    Player.super.init(self)

    self.x = x
    self.y = y
    self.img = img
    self.listInstance = {}
    self.index = 1
    
    local playerImage = gfx.image.new(img)
        assert(playerImage)

    gfx.pushContext(playerImage)
        playerSprite = gfx.sprite.new( playerImage )
    gfx.popContext(playerImage)

    self:moveTo(self.x, self.x)

    self:setImage(playerImage)  
    print(self.x .. "  " .. self.y)
    
end

function Player:update()
    if pd.buttonJustPressed(pd.kButtonLeft) and self.x > 120 then
        self:moveTo(self.x-80, self.y)
        print(self.x .. "  " .. self.y)
    elseif pd.buttonJustPressed(pd.kButtonRight) and self.x < 280 then
        self:moveTo(self.x + 80, self.y)
        print(self.x .. "  " .. self.y)

    elseif pd.buttonJustPressed(pd.kButtonUp) and self.y > 40 then
        self:moveTo(self.x, self.y-80)

    elseif pd.buttonJustPressed(pd.kButtonDown) and self.y < 200 then
        self:moveTo(self.x, self.y+80)
    end

    if pd.buttonJustPressed(pd.kButtonA) then

        instance = Instance(self.x,self.y,"player/player")
        instance:add()
        self.listInstance[self.index] = instance
        self.index += 1

        print(instance.GetPosition())
        
    end
    
end
import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "playerInstance"
import "level"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y, img, availableBox)
    Player.super.init(self)

    self.x = x
    self.y = y
    self.img = img
    self.listInstance = {}
    self.index = 1
    self.availableBox = availableBox
    
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
    
        if level.isAvailableBox(self, availableBox, self.x,self.y) then
            instance = Instance(self.x,self.y,"player/player")
            instance:add()


            self.listInstance[self.index] = instance
            self.index += 1

            self.getVictoryCondition(self)
            self.availableBox = level.updateAvailableBox(self, availableBox, instance)

        else
            print("you can't play here.")
        end
        
    end

    if pd.buttonJustPressed(pd.kButtonB) then

        for i, inst in pairs(self.listInstance) do
            gfx.sprite.removeSprite(inst)
        end
        
    end

    
    
end

function Player:getVictoryCondition()
    if table.getsize(self.listInstance) > 3 then
        
        
    end
end


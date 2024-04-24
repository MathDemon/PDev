local pd <const> = playdate
local gfx <const> = pd.graphics

class('Circle').extends(gfx.sprite)

function Circle:init(x, y, r)
    Circle.super.init(self)

    
    self:moveTo(x, y)
    local circleImage = gfx.image.new(r*2, r*2)
    gfx.pushContext(circleImage)
        gfx.fillCircleAtPoint(r,r,r)
    gfx.popContext()
    self:setImage(circleImage)
    self.speed = 5
end

function Circle:update()
    if pd.buttonIsPressed(pd.kButtonDown) then
        self:moveBy(0, self.speed)
    elseif pd.buttonIsPressed(pd.kButtonUp) then
        self:moveBy(0, -self.speed)
    elseif pd.buttonIsPressed(pd.kButtonLeft) then
        self:moveBy(-self.speed, 0)
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        self:moveBy(self.speed, 0)
    end
end
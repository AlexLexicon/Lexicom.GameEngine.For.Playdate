cls_ShipButton = "ShipButton"
class(cls_ShipButton).extends()

function ShipButton:init(container, ship)
    self.dis = container:get(i_Display)
    self.gfx = container:get(i_Graphics)
    self.fontService = container:get(i_FontService)

    self.visibleAtOnce = 3
    self.padding = 15

    self.ship = ship
    self.sprite = nil
    self.buttonWidth = nil
    self.buttonHeight = nil

    self:render()
end

function ShipButton:render()
    local screenWidth = self.dis.getWidth()
    local screenHeight = self.dis.getHeight()

    self.buttonWidth = screenWidth - self.padding * 2
    self.buttonHeight = (screenHeight - (self.padding * (2 + self.visibleAtOnce - 1))) / (self.visibleAtOnce + 1)

    local image = self.gfx.image.new(self.buttonWidth, self.buttonHeight, self.gfx.kColorWhite)
    local font = self.fontService:getFont()

    self.gfx.pushContext(image)
    self.gfx.setColor(self.gfx.kColorBlack)
    self.gfx.setFont(font)
    self.gfx.drawRect(0, 0, self.buttonWidth, self.buttonHeight)
    self.gfx.drawText(self.ship.name, self.buttonWidth / 2, self.buttonHeight / 2)
    self.gfx.popContext()

    self.sprite = self.gfx.sprite.new(image)
    self.sprite:add()
end

function ShipButton:update()
    
end
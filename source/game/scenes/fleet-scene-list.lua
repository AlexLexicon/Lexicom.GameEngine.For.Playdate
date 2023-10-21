cls_FleetSceneList = "FleetSceneList"
class(cls_FleetSceneList).extends()

function FleetSceneList:init(container)
    self.pd = container:get(i_Playdate)
    self.gfx = container:get(i_Graphics)
    self.inputService = container:get(i_InputService)
    self.mathService = container:get(i_MathService)

    self.sprites = {}
    self.scrollIndex = 1
    self.fleetService = container:get(i_FleetService)
end

function FleetSceneList:show()
    local font = self.gfx.font.new("font/font-Cuberick-Bold")

    local ships = self.fleetService:getShips()
    for shipIndex, ship in pairs(ships) do
        local image = self.gfx.image.new(self.buttonWidth, self.buttonHeight, self.gfx.kColorWhite)

        self.gfx.pushContext(image)
        self.gfx.setColor(self.gfx.kColorBlack)
        self.gfx.setFont(font)
        self.gfx.drawRect(0, 0, self.buttonWidth, self.buttonHeight)
        self.gfx.drawText(ship.name, self.buttonWidth / 2, self.buttonHeight / 2)
        self.gfx.popContext()

        local sprite = self.gfx.sprite.new(image)
        sprite:add()

        self.sprites[#self.sprites + 1] = sprite
    end

    self:selectButton(0)
end

function FleetSceneList:selectButton(index)
    local screenWidth = self.dis.getWidth()

    self.scrollIndex = self.mathService:clamp(index, 0, #self.sprites - self.visibleAtOnce)

    for spriteIndex, sprite in pairs(self.sprites) do
        local y = (((self.buttonHeight) + self.padding) * (spriteIndex - self.scrollIndex))
        sprite:moveTo(screenWidth / 2, y)
    end
end

function FleetSceneList:update()
    if self.inputService:isUpJustReleased() then
        self:scroll(self.scrollIndex - 1)
    elseif self.inputService:isDownJustReleased() then
        self:scroll(self.scrollIndex + 1)
    end
end
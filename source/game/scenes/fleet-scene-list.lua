cls_FleetSceneList = "FleetSceneList"
class(cls_FleetSceneList).extends()

function FleetSceneList:init(container)
    self.pd = container:get(i_Playdate)
    self.gfx = container:get(i_Graphics)
    self.inputService = container:get(i_InputService)
    self.mathService = container:get(i_MathService)
    self.shipButtonFactory = container:get(i_ShipButtonFactory)

    self.buttons = {}
    self.scrollIndex = 1
    self.fleetService = container:get(i_FleetService)
end

function FleetSceneList:show()
    local ships = self.fleetService:getShips()
    for shipIndex, ship in pairs(ships) do
        local shipButton = self.shipButtonFactory:create(ship)

        table.insert(self.buttons, shipButton)
    end

    self:selectButton(0)
end

function FleetSceneList:selectButton(index)
    --[[local screenWidth = self.dis.getWidth()

    self.scrollIndex = self.mathService:clamp(index, 0, #self.sprites - self.visibleAtOnce)

    for spriteIndex, sprite in pairs(self.sprites) do
        local y = (((self.buttonHeight) + self.padding) * (spriteIndex - self.scrollIndex))
        sprite:moveTo(screenWidth / 2, y)
    end]]
end

function FleetSceneList:update()
    --[[if self.inputService:isUpJustReleased() then
        self:scroll(self.scrollIndex - 1)
    elseif self.inputService:isDownJustReleased() then
        self:scroll(self.scrollIndex + 1)
    end]]--
end
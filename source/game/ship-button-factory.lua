cls_ShipButtonFactory = "ShipButtonFactory"
class(cls_ShipButtonFactory).extends()

function ShipButtonFactory:init(container)
    self.container = container
end

function ShipButtonFactory:create(ship)
    return _G[cls_ShipButton](self.container, ship)
end
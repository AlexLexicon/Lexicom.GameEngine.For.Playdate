cls_ShipFactory = "ShipFactory";
class(cls_ShipFactory).extends()

function ShipFactory:init(container)
    self.container = container
end

function ShipFactory:create(class)
    return _G[cls_Ship](self.container, class)
end
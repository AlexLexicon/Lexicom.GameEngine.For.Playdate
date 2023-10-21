cls_Ship = "Ship";
class(cls_Ship).extends()

function Ship:init(container, class)

    local namesService = container:get(i_NamesService)

    self.name = namesService:generateShipName()
    self.class = class
end
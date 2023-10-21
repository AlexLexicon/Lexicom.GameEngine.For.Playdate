cls_NamesService = "NamesService";
class(cls_NamesService).extends()

local index = 0;

function NamesService:init(container)
    self.container = container
end

function NamesService:generateShipName()
    index = index + 1

    return "my ship "..tostring(index)
end